import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/food_details_model.dart';
import 'package:bmi_tracker_mb_advisor/models/food_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../repositories/food_repository.dart';

class FoodDetailsController extends GetxController {
  var isLoading = false.obs;

  Rx<FoodDetailsModel> foodModel = FoodDetailsModel().obs;

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

  getFoodByID(int foodID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await FoodRepository.getFoodByID(foodID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      foodModel.value = FoodDetailsModel.fromJson(jsonDecode(response.body));
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
