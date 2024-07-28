import 'package:bmi_tracker_mb_advisor/screens/member/controller/member_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/controller/workspace_controller.dart';
import 'package:get/get.dart';

import '../../../config/firebase_messaging_service.dart';

class BottomNavBinding extends Bindings {
  @override
  Future<void> dependencies() async {

    // Khởi tạo dịch vụ Firebase Messaging và đăng ký với GetX
    final firebaseMessagingService = FirebaseMessagingService();
    await firebaseMessagingService.init();
    Get.put(firebaseMessagingService);
  }
}
