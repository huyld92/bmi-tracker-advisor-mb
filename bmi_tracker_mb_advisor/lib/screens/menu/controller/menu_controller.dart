import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/menu_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/menu_repository.dart';

import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';

class MenuScreenController extends GetxController {
  RxList<MenuModel> menus = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMenuScreenData();
    super.onInit();
  }

  Future<void> fetchMenuScreenData() async {
    isLoading.value = true;

    await getAllMenu();

    isLoading.value = false;

    // menus.add(MenuModel(
    //     advisorID: 1,
    //     isActive: true,
    //     advisorName: "Aaa",
    //     menuDescription: "Menu description",
    //     menuID: 1,
    //     menuName: "menu name",
    //     menuPhoto: "linkphoto",
    //     totalCalories: 200));
    // menus.add(MenuModel(
    //     advisorID: 1,
    //     isActive: true,
    //     advisorName: "Aaa",
    //     menuDescription: "Menu description",
    //     menuID: 1,
    //     menuName: "menu name",
    //     menuPhoto: "linkphoto",
    //     totalCalories: 200));
    // menus.add(MenuModel(
    //     advisorID: 1,
    //     isActive: true,
    //     advisorName: "Aaa",
    //     menuDescription: "Menu description acsac ascascacacascsakcsamckasmckasmckamkkan ckn ackmas ckmaskcmaskcm akm caskcm akcmaskcm askcmaskcmksacm sakcm kascm akscmsakcmaskcmaskcmskm",
    //     menuID: 1,
    //     menuName: "menu name",
    //     menuPhoto: "linkphoto",
    //     totalCalories: 200));
  }

  getAllMenu() async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getAllMenu();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      menus.value = menuModelsFromJson(response.body);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      menus.clear();
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

  void floatingAddButton() {}

  void goToMenuDetails(int index) {
    Get.toNamed(AppRoutes.menuDetailsScreen, arguments: menus[index].menuID);
  }
}
