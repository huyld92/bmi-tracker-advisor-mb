// import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/repositories/package_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/package/controller/package_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/package/model/package_model.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

class CreatePackageController extends GetxController {
  final GlobalKey<FormState> createPackageFormKey = GlobalKey<FormState>();
  late TextEditingController txtPackageNameController;
  late TextEditingController packagePriceController;
  late TextEditingController packageDescriptionController;
  late TextEditingController packageDurationController;

  var packageName = '';
  var packagePrice = '';
  var link = '';
  var packageDescription = '';
  var packageDuration = '';
  var errorString = ''.obs;
  var isLoading = false.obs;

  Rx<PackageModel> packageModel = PackageModel().obs;

  @override
  void onInit() {
    txtPackageNameController = TextEditingController();
    packagePriceController = TextEditingController();
    packageDescriptionController = TextEditingController();
    packageDurationController = TextEditingController();
    errorString.obs;
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    txtPackageNameController.dispose();
    packagePriceController.dispose();
    packageDescriptionController.dispose();
    packageDurationController.dispose();
    super.onClose();
  }

  String? validatePackageName(String value) {
    if (value.isEmpty) {
      return "Package name is invalid";
    }
    return null;
  }

  String? validatePackagePrice(String value) {
    if (value.isEmpty) {
      return "Price is invalid";
    }
    // Kiểm tra xem phải là số dương
    int? packagePrice = int.tryParse(value);
    if (packagePrice! <= 0) {
      return "Price is invalid";
    }
    return null;
  }

  String? validatePackageDescription(String value) {
    if (value.isEmpty) {
      return "package Description is invalid";
    }
    return null;
  }

  String? validatePackageDuration(String value) {
    if (value.isEmpty) {
      return "Package Duration is invalid";
    }
    return null;
  }

  Future<void> createPackage() async {
    isLoading = true.obs;
    final isValid = createPackageFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createPackageFormKey.currentState!.save();
    // print('aa:${packagePriceController.text}');
    double price = double.parse(packagePriceController.text);
    PackageModel createPackage = PackageModel(
      packageName: txtPackageNameController.text,
      price: price,
      description: packageDescriptionController.text,
      packageDuration: int.parse(packageDurationController.text),
    );

    var response = await PackageRepository.createNewPackage(createPackage);

    //kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json
      var packageController = Get.find<PackageController>();
      await packageController.fetchPackage();

      Get.back();
      Get.snackbar('Success', 'Create package successful');
      log(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      // thông báo lỗi
      Get.snackbar("Create failed!", jsonDecode(response.body)["message"]);
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }

    isLoading = false.obs;
  }
}
