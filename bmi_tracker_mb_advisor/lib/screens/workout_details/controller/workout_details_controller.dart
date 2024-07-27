import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class WorkoutDetailsController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchWorkoutDetailsData();
    super.onInit();
  }

  Future<void> fetchWorkoutDetailsData() async {
    isLoading.value = true;
    int memberID = Get.arguments;
    isLoading.value = false;
  }
}
