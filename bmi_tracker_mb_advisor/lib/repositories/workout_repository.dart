import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:bmi_tracker_mb_advisor/models/update_workout_request.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/model/workout_exercise_request_model.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';
import '../screens/create_workout/model/create_workout_model.dart';

class WorkoutRepository {
  static Future<http.Response> getAllWorkout() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("workouts/getByAdvisor"), headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getAvailableWorkout() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("workouts/advisor/get-available"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getWorkoutByWorkoutID(int workoutID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("workouts/getByID?workoutID=$workoutID"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> createNewWorkout(
      CreateWorkoutModel createWorkoutModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .post(
          BuildServer.buildUrl("workouts/createNew"),
          headers: header,
          body: jsonEncode(createWorkoutModel),
        )
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> updateWorkout(
      WorkoutRequestModel workoutRequestModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(
          BuildServer.buildUrl("workouts/update"),
          headers: header,
          body: jsonEncode(workoutRequestModel),
        )
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> deactivateWorkout(int? workoutID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .delete(
          BuildServer.buildUrl("workouts/deactivate/$workoutID"),
          headers: header,
        )
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static activateWorkout(int? workoutID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.put(
      BuildServer.buildUrl("workouts/activate?workoutID=$workoutID"),
      headers: header,
    );

    return response;
  }

  static createWorkoutExercise(WorkoutExerciseRequestModel requestModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
      BuildServer.buildUrl("workouts/createWorkoutExercises"),
      headers: header,
      body: jsonEncode(requestModel),
    );

    return response;
  }

  static deleteWorkoutExercise(int workoutExerciseID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.delete(
      BuildServer.buildUrl(
          "workouts/workout-exercise/delete?workoutExerciseID=$workoutExerciseID"),
      headers: header,
    );

    return response;
  }

  static assignWorkout(memberID, int workoutID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.put(
      BuildServer.buildUrl(
          "workout-history/assignWorkout?workoutID=$workoutID&memberID=$memberID"),
      headers: header,
    );

    return response;
  }
}
