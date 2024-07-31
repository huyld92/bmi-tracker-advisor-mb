import 'package:bmi_tracker_mb_advisor/screens/blog/model/blog_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class BlogDetailController extends GetxController {
  var isloading = false.obs;
  Rx<BlogModel> blogModel = BlogModel().obs;

  @override
  Future<void> onInit() async {
    blogModel.value = Get.arguments;

    // TODO: implement onInit
    super.onInit();
  }
}
