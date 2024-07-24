// import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

import 'package:bmi_tracker_mb_advisor/localization/app_localization.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
 import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/initial_bindings.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
    //       ..subscriptionType = CometChatSubscriptionType.allUsers
    //       ..autoEstablishSocketConnection = true
    //       ..region = "IN" //Replace with your region
    //       ..appId = cometAppId //replace with your app Id
    //       ..authKey = cometAuthKey
    //       ..extensions = CometChatUIKitChatExtensions
    //           .getDefaultExtensions() //replace this with empty array you want to disable all extensions
    //     ) //replace with your auth Key
    //     .build();

    // CometChatUIKit.init(
    //     uiKitSettings: uiKitSettings,
    //     onSuccess: (String successMessage) {
    //       debugPrint("Initialization completed successfully  $successMessage");
    //     },
    //     onError: (CometChatException e) {
    //       debugPrint("Initialization failed with exception: ${e.message}");
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      theme: theme,
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'BMI Tracker Advisor',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
