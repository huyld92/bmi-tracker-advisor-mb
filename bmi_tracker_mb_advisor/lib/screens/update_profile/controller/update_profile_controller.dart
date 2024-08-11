import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bmi_tracker_mb_advisor/screens/profile/controller/profile_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../../../models/account_model.dart';
import '../../../repositories/account_repository.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  Rx<AccountModel> accountModel = AccountModel().obs;
  TextEditingController txtFullNameController = TextEditingController();
  TextEditingController txtPhoneNumberController = TextEditingController();
  TextEditingController txtBankNumberController = TextEditingController();

  RxString birthday = "".obs;
  RxString gender = "".obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEditProfileScreenData();
    super.onInit();
  }

  Future<void> fetchEditProfileScreenData() async {
    isLoading.value = true;

    await getProfile();
    // tạo controller cho các TextEditing
    txtFullNameController =
        TextEditingController(text: accountModel.value.fullName);

    txtPhoneNumberController =
        TextEditingController(text: accountModel.value.phoneNumber);
    txtBankNumberController =
        TextEditingController(text: accountModel.value.bankNumber);

    gender.value = accountModel.value.gender!;

    birthday.value = accountModel.value.birthday!.format();

    isLoading.value = false;
  }

  getProfile() async {
    var response = await AccountRepository.getProfile();
    if (response.statusCode == 200) {
      accountModel.value = AccountModel.fromJson(jsonDecode(response.body));
      print('accountModel:${accountModel.value.accountPhoto}');
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server", json.decode(response.body)['message']);
    }
  }

  Future<void> updatePhotoLink(String photoUrl) async {
    // gọi repository cập nhật link image
    var response = await AccountRepository.updateAccountPhoto(photoUrl);

    if (response.statusCode == 200) {
      // thành công gán giá trị cho member
      accountModel.value.accountPhoto = photoUrl;
      await updateComet();
    } else {
      // thât bại show snack bar kết quả
      var jsonResult = jsonDecode(response.body);
      Get.snackbar("Failed upload image", "${jsonResult["message"]}");
    }
  }

  Future<void> updateComet() async {
    CometChat.updateUser(
      User(
          name: accountModel.value.fullName!,
          avatar: accountModel.value.accountPhoto!,
          uid: accountModel.value.accountID.toString()),
      cometRestKey,
      onSuccess: (message) {
        debugPrint('Update successfully: $message');
      },
      onError: (CometChatException ce) {
        debugPrint('Create user failed: ${ce.message}');
      },
    );
  }

  Future<void> selectAndUploadImage() async {
    isLoading.value = true;

    final XFile? image = await pickImage(); // Chọn ảnh từ thư viện
    if (image != null) {
      final String? downloadUrl = await uploadImage(
          image); // Upload ảnh lên Firebase Storage và nhận link tải xuống
      if (downloadUrl != null) {
        // Gọi API để cập nhật link ảnh lên server
        // currentMember.value.accountPhoto = downloadUrl;
        updatePhotoLink(downloadUrl);

        // cập nhật lại thông tin member
        accountModel.value = AccountModel();
        await getProfile();
      } else {
        log('Failed to get download URL'); // Xử lý lỗi nếu không nhận được link tải xuống
      }
    } else {
      log('No image selected'); // Xử lý lỗi nếu không chọn ảnh
    }
    isLoading.value = false;
  }

  // Hàm để chọn ảnh từ thư viện
  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker(); // Khởi tạo ImagePicker
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery); // Chọn ảnh từ thư viện

    return image; // Trả về ảnh đã chọn
  }

  // Hàm để upload ảnh lên Firebase Storage và nhận link tải xuống
  Future<String?> uploadImage(XFile image) async {
    try {
      final objectHashCode = accountModel.value.hashCode;
      final fileName = objectHashCode.toRadixString(16);
      // Tham chiếu đến Firebase Storage
      final storageRef = FirebaseStorage.instance.ref();
      // Tạo đường dẫn để lưu ảnh trong Firebase Storage
      final imageRef = storageRef.child('$fileName.jpg');

      // Upload ảnh lên Firebase Storage
      final uploadTask = imageRef.putFile(File(image.path));
      // Đợi upload hoàn tất
      final snapshot = await uploadTask.whenComplete(() => null);
      // Lấy link tải xuống của ảnh
      final downloadUrl = await snapshot.ref.getDownloadURL();
      // Trả về link tải xuống
      return downloadUrl;
    } catch (e) {
      log('Error uploading image: $e'); // Xử lý lỗi khi upload ảnh
      return null; // Trả về null nếu có lỗi
    }
  }

  Future<void> updateProfile() async {
    isLoading.value = true;
    var userUpdate = {
      "fullName": txtFullNameController.text,
      "phoneNumber": txtPhoneNumberController.text,
      "gender": gender.value,
      "bankNumber": txtBankNumberController.text,
      "birthday": birthday.value
    };
    // gọi repository update profile
    var response = await AccountRepository.updateProfile(userUpdate);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      Get.snackbar("Update profile", jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 400) {
      // thông báo lỗi
      Get.snackbar("Update failed!", jsonDecode(response.body)["message"]);
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }

    // cập nhật lại thông tin member
    accountModel.value = AccountModel();
    await getProfile();
    await updateComet();
    isLoading.value = false;
  }
}
