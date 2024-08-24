import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/account_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
// import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

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
      accountModel.value = AccountModel();
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
    // await CometChat.logout(
    //   onSuccess: (message) {},
    //   onError: (excep) {},
    // );
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  goToUpdateProfileScreen() {
    Get.toNamed(AppRoutes.updateProfileScreen)
        ?.then((value) async => await fetchProfileScreeData());
  }

  void goToPackageScreen() {
    Get.toNamed(AppRoutes.packageScreen);
  }

  void goToSubscriptionHistory() {
    Get.toNamed(AppRoutes.subscriptionHistoryScreen);
  }

  void goToCommission() {
    Get.toNamed(AppRoutes.commissionScreen);
  }

  void goToRequestScreen() {
    Get.toNamed(AppRoutes.requestScreen);
  }

  void goToCertificateScreen() {
    Get.toNamed(AppRoutes.certificateScreen);
  }

  void goToChangePasswordScreen() {
    Get.toNamed(AppRoutes.changePasswordScreen);
  }
}
