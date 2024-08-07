import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/blog_repository.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog/model/blog_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class BlogDetailController extends GetxController {
  var isLoading = false.obs;
  Rx<BlogModel> blogModel = BlogModel().obs;

  @override
  Future<void> onInit() async {
    blogModel.value = Get.arguments;

    // TODO: implement onInit
    super.onInit();
  }

  void goToUpdateBlogScreen() {
    Get.toNamed(AppRoutes.updateBlogScreen, arguments: blogModel.value)
        ?.then((value) {
      if (value != null) {
        isLoading.value = true;
        blogModel.value = value;
        blogModel.refresh();
        isLoading.value = false;
      }
    });
  }

  Future<void> deactivateBlog() async {
    isLoading.value = true;
    // gọi API deactivate blog
    var response = await BlogRepository.deactivateBlog(blogModel.value.blogId);

    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // 204 thành công cập nhật giá trị tại index
      Get.back(result: true);
      // Get.snackbar("Activate workout", "Activate workout success!");
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
    isLoading.value = false;
  }
}
