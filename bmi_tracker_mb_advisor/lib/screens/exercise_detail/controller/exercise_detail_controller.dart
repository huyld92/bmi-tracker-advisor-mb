import 'package:bmi_tracker_mb_advisor/models/exercise_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ExerciseDetailsController extends GetxController {
  var isLoading = false.obs;
  Rx<ExerciseModel> exerciseUIModels = ExerciseModel().obs;

  @override
  Future<void> onInit() async {
    exerciseUIModels.value = Get.arguments;

    print('ExerciseModel:${exerciseUIModels.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
