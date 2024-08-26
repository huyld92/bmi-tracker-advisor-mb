import 'dart:convert';
import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog/model/blog_model.dart';

import '../../../repositories/blog_repository.dart';
import '../../../util/app_export.dart';

class BlogController extends GetxController {
  var isLoading = false.obs;
  var blogList = <BlogModel>[].obs;

  // var blogModel = BlogModel().obs;

  @override
  Future<void> onInit() async {
    fetchDataBlogScreen();
    super.onInit();
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    // await Future.delayed(Duration(seconds: 1));
    await fetchDataBlogScreen();
    isLoading.value = false;
    update();
  }

  Future<void> fetchDataBlogScreen() async {
    isLoading.value = true;
    await getAllBlog();
    isLoading.value = false;
  }

  Future<void> getAllBlog() async {
    var response = await BlogRepository.getAllBlog();

    // log('response: ${response}');
    if (response.statusCode == 200) {
      // chuyển dổi từ json sang advisor model
      blogList.value = blogModelFromJson(response.body);
      log('get all blog');
    } else if (response.statusCode == 204) {
      // Quay về màn hình trước đó khi advisor không tồn tại
      blogList.clear();
      blogList.sort((a, b) => b.blogId!.compareTo(a.blogId!));
      // Get.back();
      // Get.snackbar(
      //     "Blogs does not exist!", 'This advisor has not created any blog yet');
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

    update();
  }

  void goToCreateBlog() {
    Get.toNamed(AppRoutes.createBlogScreen)?.then((value) => {
          if (value != null && value) {fetchDataBlogScreen()}
        });
  }

  void goToBlogDetail(int index) {
    Get.toNamed(AppRoutes.blogDetailsScreen, arguments: blogList[index])
        ?.then((value) {
      if (value != null && value) {
        blogList.removeAt(index);
      }
      isLoading.value = true;
      blogList.refresh();
      isLoading.value = false;
    });
    ;
  }
}
