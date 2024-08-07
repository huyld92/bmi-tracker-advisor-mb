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
}
