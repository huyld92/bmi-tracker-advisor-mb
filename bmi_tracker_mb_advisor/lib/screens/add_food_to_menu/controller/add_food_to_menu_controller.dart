import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/enums/enum_user_request.dart';
import 'package:bmi_tracker_mb_advisor/models/food_model.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/controller/create_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/menu_food_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/model/create_menu_food_request.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/enums/EMealType.dart';
import '../../../repositories/food_repository.dart';

class AddFoodToMenuController extends GetxController {
  // meal type của những food sẽ add vào menu
  var selectedMeal = EMealType.Breakfast.obs;

  // danh sách food mặc định để khi search hoặc filter không làm thay đổi danh sách food ban đầu
  List<FoodModel> foodDefaults = List.empty();

  // danh sách food dùng để hiển thị UI
  RxList<FoodModel> foodUIModels = RxList.empty();

  // food được chọn để add vào menu
  RxList<bool> foodSelected = RxList.empty();

  // menu ID dùng để xác định food sẽ được thêm vào menu nào
  int? menuID;

  // check loading state
  var isLoading = false.obs;

  // giá trị của filter
  String selectedFilter = 'All';

  // giá trị của sort
  RxString currentSortCriteria = 'Sort A-Z'.obs;

  @override
  Future<void> onInit() async {
    fetchAddFoodToMenuData();
    super.onInit();
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    await fetchAddFoodToMenuData();
    isLoading.value = false;
    update();
  }

  Future<void> fetchAddFoodToMenuData() async {
    isLoading.value = true;
    menuID = Get.arguments;
    await getAllFood();
    sortFood("Sort A-Z");
    foodSelected = RxList.generate(foodUIModels.length, (index) => false);
    isLoading.value = false;
  }

  void selectMeal(EMealType meal) {
    selectedMeal.value = meal;
  }

  getAllFood() async {
    // gọi API lấy danh sách menu của advisor
    var response = await FoodRepository.getAllFood();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      foodUIModels.value = foodModelsFromJson(response.body);
      // tạo giá trị cho food default
      foodDefaults = foodModelsFromJson(response.body);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      foodUIModels.clear();
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

  void onSelectFood(int index) {
    foodSelected[index] = !foodSelected[index];
  }

  void addFoodToMenu() {
    if (menuID == null) {
      var createMenuController = Get.find<CreateMenuController>();
      for (int i = 0; i < foodSelected.length; i++) {
        if (foodSelected[i]) {
          createMenuController.menuFoodModels.add(MenuFoodModel(
              foodName: foodUIModels[i].foodName,
              mealType: selectedMeal.value.name,
              foodID: foodUIModels[i].foodID,
              foodPhoto: foodUIModels[i].foodPhoto));
          createMenuController.createMenuFoodModels.add(MenuFoodRequestModel(
            foodID: foodUIModels[i].foodID,
            mealType: selectedMeal.value.name,
          ));
        }
      }
      Get.back();
    } else {
      List<CreateMenuFoodRequest> createMenuFoodRequests =
          List.empty(growable: true);
      for (int i = 0; i < foodSelected.length; i++) {
        if (foodSelected[i]) {
          createMenuFoodRequests.add(CreateMenuFoodRequest(
            menuID: menuID,
            foodID: foodUIModels[i].foodID,
            mealType: selectedMeal.value.name,
          ));
        }
      }
      Get.back(result: createMenuFoodRequests);
    }
  }

  void goToFoodDetails(int? foodID) {
    Get.toNamed(AppRoutes.foodDetailsScreen, arguments: foodID);
  }

  void goToCreateRequest() {
    Get.toNamed(AppRoutes.createRequestScreen,
        arguments: EUserRequestType.CREATE_FOOD);
  }

  void searchFoodName(String value) {
    // xóa danh sách food đang hiển thị hiện tại
    foodUIModels.clear();

    // nếu giá trị của search box empty thì hiển thị tất cả food
    if (value.isEmpty) {
      foodUIModels.addAll(foodDefaults);
    } else {
      // duyệt danh sách food default để tìm food name theo value
      for (var food in foodDefaults) {
        // chuyển foodName và value và lowerCase để so sánh
        if (food.foodName!.toLowerCase().contains(value.toLowerCase())) {
          // nếu food Name có giá trị phù hợp với value => thêm food vào foodUIModels
          foodUIModels.add(food);
        }
      }
    }

    sortFood(currentSortCriteria.value);
  }

  void filterFood(String? newValue) {
    selectedFilter = newValue!;
  }

  void sortFood(String? newValue) {
    // cập nhật giá trị đang được chọn của sort
    currentSortCriteria.value = newValue!;
    // Xác định giá trị đang được chọn
    switch (currentSortCriteria.value) {
      // Alphabet giảm dần
      case 'Sort A-Z':
        foodUIModels.sort((a, b) => a.foodName!.compareTo(b.foodName!));
        break;
      // Alphabet tăbg dần
      case 'Sort Z-A':
        foodUIModels.sort((a, b) => b.foodName!.compareTo(a.foodName!));
        break;
      // food mới nhất
      case 'Sort Newest':
        foodUIModels.sort((a, b) => b.foodID!.compareTo(a.foodID!));
        break;
      // food cũ nhất
      case 'Sort Oldest':
        foodUIModels.sort((a, b) => a.foodID!.compareTo(b.foodID!));
        break;
    }
  }
}
