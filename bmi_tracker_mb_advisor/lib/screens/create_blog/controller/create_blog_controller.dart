import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:bmi_tracker_mb_advisor/repositories/blog_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog/controller/blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog/model/blog_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/model/create_blog_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';

class CreateBlogController extends GetxController {
  final GlobalKey<FormState> blogFormKey = GlobalKey<FormState>();
  late TextEditingController blogNameController;
  late TextEditingController blogContentController;

  // late TextEditingController blogPhotoController;
  late TextEditingController linkController;
  var blogName = '';
  var blogContent = '';
  var link = '';
  var errorString = ''.obs;
  var isLoading = false.obs;

  Rx<BlogModel> blogModel = BlogModel().obs;

  var isFile = false.obs;

  var imagePath = "".obs;

  @override
  void onInit() {
    blogNameController = TextEditingController();
    blogContentController = TextEditingController();
    // blogPhotoController = TextEditingController();
    linkController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    blogNameController.dispose();
    blogContentController.dispose();
    // blogPhotoController.dispose();
    linkController.dispose();
    super.onClose();
  }

  String? validateBlogName(String value) {
    if (value.isEmpty) {
      return "Blogname is invalid";
    }
    return null;
  }

  String? validateBlogContent(String value) {
    if (value.isEmpty) {
      return "Blogname is invalid";
    }
    return null;
  }

  String? validateLink(String value) {
    if (value.isEmpty) {
      return "Blogname is invalid";
    }
    return null;
  }

  // Future<void> updatePhotoLink(String photoUrl) async {
  //   // gọi repository cập nhật link image
  //   var response = await AccountRepository.updateAccountPhoto(photoUrl);

  //   if (response.statusCode == 200) {
  //     // thành công gán giá trị cho member
  //     accountModel.value.accountPhoto = photoUrl;
  //   } else {
  //     // thât bại show snack bar kết quả
  //     var jsonResult = jsonDecode(response.body);
  //     Get.snackbar("Failed upload image", "${jsonResult["message"]}");
  //   }
  // }

  // Hàm để chọn ảnh từ thư viện
  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker(); // Khởi tạo ImagePicker
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery); // Chọn ảnh từ thư viện

    return image; // Trả về ảnh đã chọn
  }

  Future<void> selectImage() async {
    isLoading.value = true;

    final XFile? image = await pickImage(); // Chọn ảnh từ thư viện
    if (image != null) {
      print('aaaa:${imagePath}');
      imagePath.value = image.path;
      isFile.value = true;
      isLoading.value = false;
    } else {
      log('No image selected'); // Xử lý lỗi nếu không chọn ảnh
    }
    isLoading.value = false;
  }

  Future<String?> uploadImage(String imagePath) async {
    try {
      String fileName = path.basename(imagePath);
      // Tham chiếu đến Firebase Storage
      final storageRef = FirebaseStorage.instance.ref();
      // Tạo đường dẫn để lưu ảnh trong Firebase Storage
      final imageRef = storageRef.child('$fileName');

      // Upload ảnh lên Firebase Storage
      final uploadTask = imageRef.putFile(File(imagePath));
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

  Future<void> createBlog() async {
    // Show loading khi đợi
    isLoading = true.obs;

    // final isValid = blogFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // blogFormKey.currentState!.save();
    if (imagePath.isNotEmpty) {
      String? imageUrl = await uploadImage(imagePath.value);
      blogModel.value.blogPhoto = imageUrl;
    }

    //tạo blog model
    BlogModel createBlog = BlogModel(
      blogName: blogNameController.text,
      blogContent: blogContentController.text,
      blogPhoto: blogModel.value.blogPhoto!,
      link: linkController.text,
    );
    var response = await BlogRepository.createBlog(createBlog);

    //kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json

      Get.back(result: true);
      Get.snackbar("Success", jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 400) {
      // thông báo lỗi
      Get.snackbar("Create failed!", jsonDecode(response.body)["message"]);
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }

    isLoading = false.obs;
  }
}
