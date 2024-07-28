import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/add_exercise_to_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/binding/add_exercise_to_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/add_food_to_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/binding/add_food_to_menu_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/bottom_nav.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/binding/create_blog_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/create_blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/binding/create_menu_biding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/create_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout.dart/binding/create_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout.dart/create_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_profile/binding/edit_profile_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_profile/edit_profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/food_detail/binding/food_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/food_detail/food_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/binding/login_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/login_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/meal_logs/binding/meal_logs_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/meal_logs/meal_logs_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/binding/member_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/member_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member_details/binding/member_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/binding/menu_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/menu_details_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/profile/binding/profile_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/profile/profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/binding/statistics_calories_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/statistics_calories_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/binding/statistics_weight_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/statistics_weight_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/binding/workout_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/workout_details_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/binding/workspace_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/workspace_screen.dart';

import '../screens/member_details/member_details_screen.dart';
import '../util/app_export.dart';

class AppRoutes {
  static const String activityLogsScreen = '/activityLogsScreen';
  static const String addFoodToMenuScreen = '/addFoodToMenuScreen';
  static const String addExerciseToWorkoutScreen =
      '/addExerciseToWorkoutScreen';
  static const String bottomNavScreen = '/bottomNavScreen';
  static const String createMenuScreen = '/createMenuScreen';
  static const String createBlogScreen = '/createBlogScreen';
  static const String createWorkoutScreen = '/createWorkoutScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String foodDetailsScreen = '/foodDetailsScreen';
  static const String loginScreen = '/loginScreen';
  static const String mealLogsScreen = '/mealLogsScreen';
  static const String memberScreen = '/memberScreen';
  static const String memberDetailsScreen = '/memberDetailsScreen';
  static const String menuScreen = '/menuScreen';
  static const String menuDetailsScreen = '/menuDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String statisticsCaloriesScreen = '/statisticsCaloriesScreen';
  static const String statisticsWeightScreen = '/statisticsWeightScreen';
  static const String workoutScreen = '/workoutScreen';
  static const String workoutDetailsScreen = '/workoutDetailsScreen';
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
      name: bottomNavScreen,
      page: () => const BottomNavScreen(),
      bindings: [
        BottomNavBinding(),
        WorkspaceBinding(),
        MemberBinding(),
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: createBlogScreen,
      page: () => const CreateBlogScreen(),
      bindings: [
        CreateBlogBinding(),
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
      name: createWorkoutScreen,
      page: () => const CreateWorkoutScreen(),
      bindings: [
        CreateWorkoutBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => const EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: foodDetailsScreen,
      page: () => const FoodDetailScreen(),
      bindings: [
        FoodDetailsBinding(),
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
      name: mealLogsScreen,
      page: () => MealLogsScreen(),
      bindings: [
        MealLogsBinding(),
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
      page: () => MemberDetailsScreen(),
      bindings: [
        MemberDetailsBinding(),
      ],
    ),
    GetPage(
      name: menuDetailsScreen,
      page: () => const MenuDetailsScreen(),
      bindings: [
        MenuDetailsBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: statisticsCaloriesScreen,
      page: () => const StatisticsCaloriesScreen(),
      bindings: [
        StatisticsCaloriesBinding(),
      ],
    ),
    GetPage(
      name: statisticsWeightScreen,
      page: () => const StatisticsWeightScreen(),
      bindings: [
        StatisticsWeightBiding(),
      ],
    ),
    GetPage(
      name: workoutDetailsScreen,
      page: () => const WorkoutDetailsScreen(),
      bindings: [
        WorkoutDetailsBinding(),
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
      name: initialRoute,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
