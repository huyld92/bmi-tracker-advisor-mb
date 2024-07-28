import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/account_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../repositories/account_repository.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  Rx<AccountModel> accountModel = AccountModel().obs;

  @override
  void onInit() {
    fetchProfileScreeData();
    super.onInit();
  }

  Future<void> fetchProfileScreeData() async {
    isLoading.value = true;
    await getProfile();
    isLoading.value = false;
  }

  getProfile() async {
    var response = await AccountRepository.getProfile();
    if (response.statusCode == 200) {
      accountModel.value = AccountModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server", json.decode(response.body)['message']);
    }
  }

  Future<void> logout() async {
    // Alert.showLoadingIndicatorDialog(context);
    PrefUtils.clearPreferencesData();
    await AccountRepository.logout();

    Get.offAllNamed(AppRoutes.loginScreen);
  }

  goToUpdateProfileScreen() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }
}
