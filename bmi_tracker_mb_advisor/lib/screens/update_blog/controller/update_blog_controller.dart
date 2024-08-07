import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:bmi_tracker_mb_advisor/repositories/blog_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../blog/model/blog_model.dart';

class UpdateBlogController extends GetxController {
  late TextEditingController txtTitleController;
  late TextEditingController txtContentController;
  late TextEditingController txtVideoLinkController;

  Rx<BlogModel> blogModel = BlogModel().obs;
  var isLoading = false.obs;
  var isFile = false.obs;

  var imagePath = "".obs;

  @override
  void onInit() {
    fetchDataUpdateBlogScreen();
    super.onInit();
  }

  Future<void> fetchDataUpdateBlogScreen() async {
    isLoading.value = true;

    blogModel.value = Get.arguments;
    txtTitleController = TextEditingController(text: blogModel.value.blogName);
    txtContentController =
        TextEditingController(text: blogModel.value.blogContent);
    txtVideoLinkController = TextEditingController(text: blogModel.value.link);

    isLoading.value = false;
  }

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

  Future<void> updateBlog() async {
    if (imagePath.isNotEmpty) {
      String? imageUrl = await uploadImage(imagePath.value);
      blogModel.value.blogPhoto = imageUrl;
    }
    blogModel.value.blogName = txtTitleController.text;
    blogModel.value.blogContent = txtContentController.text;
    blogModel.value.link = txtVideoLinkController.text;
    var response = await BlogRepository.updateBlog(blogModel.value);
    // kiểm tra kết quả
    if (response.statusCode == 200) {
      Get.back(result: blogModel.value);
      Get.snackbar("Update blog", "Update blog success!");
    } else if (response.statusCode == 400) {
      Get.snackbar("Update blog", "Update blog failed!");
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
  }
}
