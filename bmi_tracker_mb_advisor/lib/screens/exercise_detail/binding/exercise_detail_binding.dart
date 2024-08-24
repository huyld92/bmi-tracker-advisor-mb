import 'package:bmi_tracker_mb_advisor/screens/exercise_detail/controller/exercise_detail_controller.dart';

import '../../../util/app_export.dart';

class ExerciseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseDetailsController());
  }
}
