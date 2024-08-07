import 'dart:convert';
import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/models/account_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/authentication_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_sdk/cometchat_sdk.dart';

import '../../../config/constants.dart';
import '../../../routes/app_routes.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool passwordVisible = true.obs;
  var errorString = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    if (PrefUtils.getAccessToken() != null) {
      Get.offAllNamed(AppRoutes.bottomNavScreen);
    }
    super.onReady();
  }

  @override
  void onClose() {
    // dispose controller
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty || !value.contains('@gmail.com')) {
      return "email is invalid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "password is invalid";
    }
    return null;
  }

  Future<void> login(BuildContext context) async {
    // Show loading khi đợi xác thực login
    isLoading = true.obs;

    // kiểm tra các field đã hợp lệ chưa
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();

    // tạo login model
    LoginModel loginModel = LoginModel(
        email: emailController.text, password: passwordController.text);

    // gọi api check login
    var response =
        await AuthenticationRepository.postLogin(loginToJson(loginModel));

    // mỗi lần nhấn button login sẽ xóa text trong password
    passwordController.clear();

    // Kiểm tra status code trả về
    if (response.statusCode == 202) {
      //202 là login lần đầu chưa có thông tin member cần bổ sung thêm thông tin
      // convert json response
      var data = json.decode(response.body);

      // Chuyển đổi json response thành Member model
      // loginedMember.value = MemberModel.fromJson(data);
      print('data:$data');
      // lưu accessToken và refresh token vào SharedPreferences
      PrefUtils.setAccessToken(data["accessToken"]);
      PrefUtils.setRefreshToken(data["refreshToken"]);
      errorString.value = "";
    } else if (response.statusCode == 500) {
      errorString.value = 'Timeout error occurred!';
      // có lỗi từ server
      // Get.snackbar(
      //   "Error Server ${response.statusCode}",
      //   jsonDecode(response.body)["message"],
      //   duration: 5.seconds,
      //   snackPosition: SnackPosition.BOTTOM,
      //   showProgressIndicator: true,
      //   isDismissible: true,
      // );
    } else if (response.statusCode == 200) {
      // code 200 login thành công
      var data = json.decode(response.body);

      // loginedMember.value = MemberModel.fromJson(data);

      // lưu accessToken và refresh token vào SharedPreferences
      PrefUtils.setAccessToken(data["accessToken"]);

      PrefUtils.setRefreshToken(data["refreshToken"]);

      // AccountModel currentAdvisor = AccountModel.fromJson(data);
      // await loginComet(currentAdvisor);
      errorString.value = "";
      await loginComet(data["accountID"].toString());

      // chuyển sang màn hình Home
      Get.offAllNamed(AppRoutes.bottomNavScreen);
    } else {
      // Cập nhật errorString khi bắt được lỗi
      errorString.value = 'Your email or password is incorrect!!';
      isLoading = false.obs;
    }

    // ẩn dialog loading
    isLoading = false.obs;
  }

  Future<void> loginComet(String accountID) async {
    final user = await CometChat.getLoggedInUser();
    if (user == null) {
      await CometChat.login(accountID, cometAuthKey, onSuccess: (User user) {
        log("User logged in successfully  ${user.name}");
      }, onError: (CometChatException ce) {
        log("Login failed with exception:  ${ce.message}");
      });
    }
  }

  void logoutComet() {
    CometChat.logout(onSuccess: (message) {
      debugPrint("Logout successful with message $message");
    }, onError: (CometChatException ce) {
      debugPrint("Logout failed with exception:  ${ce.message}");
    });
  }

  void goToForgotPasswordScreen() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }
}
