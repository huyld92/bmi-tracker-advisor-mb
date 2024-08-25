import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/member_basic_model.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

import '../../../repositories/member_repository.dart';

class MemberController extends GetxController with MessageListener {
  var isLoading = false.obs;
  RxList<MemberBasicModel> members = RxList.empty();

  CometChatMessageListController? messageListState;
  RxInt unreadMessage = 0.obs;

  @override
  void onInit() {
    fetchMemberScreenData();
    super.onInit();
  }

  Future<void> fetchMemberScreenData() async {
    isLoading.value = true;
    CometChat.addMessageListener("listenerId", this);
    countUnreadMessage();
    await getAllMember();

    isLoading.value = false;
  }

  @override
  void onTextMessageReceived(TextMessage textMessage) {
    print('$textMessage');
    countUnreadMessage();
    // messageListState!.addMessage(textMessage);
  }

  countUnreadMessage() async {
    var unreadMessageCount = await CometChat.getUnreadMessageCountForAllUsers();
    unreadMessage.value = 0;
    unreadMessageCount?.forEach((key, value) {
      unreadMessage.value += value;
      print('key:$key     value:$value');
    });
  }

  Future<void> refreshData() async {
    // isLoading.value = true;
    // await Future.delayed(Duration(seconds: 1));
    await fetchMemberScreenData();
    // isLoading.value = false;
   }

  getAllMember() async {
    // gọi API lấy danh sách member của advisor
    var response = await MemberRepository.getAllMember();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      members.value = memberBasicModelsFromJson(response.body);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      members.clear();
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

  void goToMemberDetails(int index) {
    Get.toNamed(AppRoutes.memberDetailsScreen,
        arguments: members[index].memberID);
  }

  void goToMessagesScreen() {}
}
