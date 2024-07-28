import 'package:bmi_tracker_mb_advisor/models/food_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class FoodDetailsController extends GetxController {
  var isLoading = false.obs;

  Rx<FoodModel> foodModel = FoodModel().obs;

  @override
  void onInit() {
    fetchFoodDetailsData();
    super.onInit();
  }

  Future<void> fetchFoodDetailsData() async {
    isLoading.value = true;
    int foodID = Get.arguments;
    await getFoodByID(foodID);
    isLoading.value = false;
  }

  getFoodByID(int foodID) {

  }
}
