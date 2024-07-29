import 'package:bmi_tracker_mb_advisor/screens/activity_logs/activity_logs_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/activity_logs/binding/activity_logs_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/add_exercise_to_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/binding/add_exercise_to_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/add_food_to_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/binding/add_food_to_menu_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog/blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog_detail/blog_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/bottom_nav/bottom_nav.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/binding/create_blog_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/create_blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/binding/create_menu_biding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/create_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout/binding/create_workout_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout/create_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_blog/binding/edit_blog_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_blog/edit_blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_profile/binding/edit_profile_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/edit_profile/edit_profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/feedback/binding/feedback_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/feedback/feedback_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/food_detail/binding/food_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/food_detail/food_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/binding/login_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/login/login_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/meal_logs/binding/meal_logs_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/meal_logs/meal_logs_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/binding/member_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/member_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member_details/binding/member_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu/binding/menu_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu/menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/binding/menu_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/menu_details_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan/binding/plan_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan/plan_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan_detail/plan_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/profile/binding/profile_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/profile/profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/binding/statistics_calories_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/statistics_calories_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/binding/statistics_weight_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/statistics_weight_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/subscription_history/binding/subscription_history_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/subscription_history/subscription_history_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/subscription_history_detail/subscription_history_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/update_menu/update_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/update_workout/update_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/binding/workout_details_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/workout_details_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/binding/workspace_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/workspace_screen.dart';

import '../screens/blog/binding/blog_binding.dart';
import '../screens/blog_detail/binding/blog_details_binding.dart';
import '../screens/member_details/member_details_screen.dart';
import '../screens/subscription_history_detail/binding/subscription_history_details_binding.dart';
import '../screens/update_menu/binding/update_menu_binding.dart';
import '../screens/update_workout/binding/update_workout_binding.dart';
import '../util/app_export.dart';

class AppRoutes {
  static const String activityLogsScreen = '/activityLogsScreen';
  static const String addExerciseToWorkoutScreen =
      '/addExerciseToWorkoutScreen';
  static const String addFoodToMenuScreen = '/addFoodToMenuScreen';
  static const String blogScreen = '/blogScreen';
  static const String blogDetailsScreen = '/blogDetailsScreen';
  static const String bottomNavScreen = '/bottomNavScreen';
  static const String createBlogScreen = '/createBlogScreen';
  static const String createMenuScreen = '/createMenuScreen';
  static const String createPlanScreen = '/createPlanScreen';
  static const String createWorkoutScreen = '/createWorkoutScreen';
  static const String editBlogScreen = '/editBlogScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String feedbackScreen = '/feedbackScreen';
  static const String foodDetailsScreen = '/foodDetailsScreen';
  static const String loginScreen = '/loginScreen';
  static const String mealLogsScreen = '/mealLogsScreen';
  static const String memberScreen = '/memberScreen';
  static const String memberDetailsScreen = '/memberDetailsScreen';
  static const String menuScreen = '/menuScreen';
  static const String menuDetailsScreen = '/menuDetailsScreen';
  static const String planScreen = '/planScreen';
  static const String planDetailsScreen = '/planDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String statisticsCaloriesScreen = '/statisticsCaloriesScreen';
  static const String statisticsWeightScreen = '/statisticsWeightScreen';
  static const String subscriptionHistoryScreen = '/subscriptionHistoryScreen';
  static const String subscriptionHistoryDetailsScreen =
      '/subscriptionHistoryDetailsScreen';
  static const String updateMenuScreen = '/updateMenuScreen';
  static const String updateWorkoutScreen = '/updateWorkoutScreen';
  static const String workoutScreen = '/workoutScreen';
  static const String workoutDetailsScreen = '/workoutDetailsScreen';
  static const String workspaceScreen = '/workspaceScreen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: activityLogsScreen,
      page: () => const ActivityLogsScreen(),
      bindings: [
        ActivityLogsBinding(),
      ],
    ),
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
      name: blogScreen,
      page: () => const BlogScreen(),
      bindings: [
        BlogBinding(),
      ],
    ),
    GetPage(
      name: blogDetailsScreen,
      page: () => const BlogDetailScreen(),
      bindings: [
        BlogDetailsBinding(),
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
        BlogBinding(),
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
      name: editBlogScreen,
      page: () => const EditBlogScreen(),
      bindings: [
        EditBlogBinding(),
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
      name: feedbackScreen,
      page: () => const FeedbackScreen(),
      bindings: [
        FeedbackBinding(),
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
      name: menuScreen,
      page: () => const MenuScreen(),
      bindings: [
        MenuBinding(),
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
      name: planScreen,
      page: () => const PlanScreen(),
      bindings: [
        PlanBinding(),
      ],
    ),
    GetPage(
      name: planDetailsScreen,
      page: () => const PlanDetailScreen(),
      bindings: [
        PlanBinding(),
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
      name: subscriptionHistoryScreen,
      page: () => const SubscriptionHistoryScreen(),
      bindings: [
        SubscriptionHistoryBinding(),
      ],
    ),
    GetPage(
      name: subscriptionHistoryDetailsScreen,
      page: () => const SubscriptionDetailsScreen(),
      bindings: [
        SubscriptionHistoryDetailsBinding(),
      ],
    ),
    GetPage(
      name: updateMenuScreen,
      page: () => const UpdateMenuScreen(),
      bindings: [
        UpdateMenuBinding(),
      ],
    ),
    GetPage(
      name: updateWorkoutScreen,
      page: () => const UpdateWorkoutScreen(),
      bindings: [
        UpdateWorkoutBinding(),
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
