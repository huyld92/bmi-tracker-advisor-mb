import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/add_exercise_to_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/binding/add_exercise_to_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/add_food_to_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/binding/add_food_to_menu_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/bottom_nav.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/binding/create_menu_biding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/create_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout.dart/binding/create_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout.dart/create_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/binding/login_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/login_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/binding/member_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/member_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member_details/binding/member_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/member_details/member_details.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/binding/workspace_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/workspace_screen.dart';

import '../util/app_export.dart';

class AppRoutes {
  static const String addFoodToMenuScreen = '/addFoodToMenuScreen';
  static const String addExerciseToWorkoutScreen =
      '/addExerciseToWorkoutScreen';
  static const String bottomNavScreen = '/bottomNavScreen';
  static const String createMenuScreen = '/createMenuScreen';
  static const String createWorkoutScreen = '/createWorkoutScreen';
  static const String loginScreen = '/loginScreen';
  static const String memberScreen = '/memberScreen';
  static const String memberDetailsScreen = '/memberDetailsScreen';
  static const String menuScreen = '/menuScreen';
  static const String menuDetailsScreen = '/menuDetailsScreen';
  static const String workoutScreen = '/workoutScreen';
  static const String workspaceScreen = '/workspaceScreen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: addExerciseToWorkoutScreen,
      page: () => const AddExerciseToWorkoutScreen(),
      bindings: [
        AddExerciseToWorkoutBinding(),
      ],
    ),
    GetPage(
      name: addFoodToMenuScreen,
      page: () => const AddFoodToMenuScreen(),
      bindings: [
        AddFoodToMenuBinding(),
      ],
    ),
    GetPage(
      name: createWorkoutScreen,
      page: () => CreateWorkoutScreen(),
      bindings: [
        CreateWorkoutBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: memberScreen,
      page: () => const MemberScreen(),
      bindings: [
        MemberBinding(),
      ],
    ),
    GetPage(
      name: memberDetailsScreen,
      page: () => const MemberDetailsScreen(),
      bindings: [
        MemberDetailsBinding(),
      ],
    ),
    GetPage(
      name: bottomNavScreen,
      page: () => const BottomNavScreen(),
      bindings: [
        BottomNavBinding(),
        WorkspaceBinding(),
        MemberBinding(),
      ],
    ),
    GetPage(
      name: workspaceScreen,
      page: () => const WorkspaceScreen(),
      bindings: [
        WorkspaceBinding(),
      ],
    ),
    GetPage(
      name: createMenuScreen,
      page: () => CreateMenuScreen(),
      bindings: [
        CreateMenuBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
