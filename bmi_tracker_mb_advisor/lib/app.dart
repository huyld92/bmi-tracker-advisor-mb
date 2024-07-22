// import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

import 'package:bmi_tracker_mb_advisor/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_health_menu/routes/app_routes.dart';
// import 'package:flutter_health_menu/util/initial_bindings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/theme.dart';

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
      title: 'BMI Tracker Advisor',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // initialBinding: InitialBindings(),
      home: const LoginScreen(),
      // initialRoute: AppRoutes.initialRoute,
      // getPages: AppRoutes.pages,
    );
  }
}
