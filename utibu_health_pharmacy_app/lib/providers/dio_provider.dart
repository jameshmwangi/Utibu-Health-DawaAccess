import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
 Future<bool> getToken(String email, String password) async {
  try {
    final dio = Dio(); // Reuse this instance across your app
    final response = await dio.post('http://127.0.0.1:8000/api/login',
        data: {'email': email, 'password': password});

    if (response.statusCode == 200 && response.data != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data);
      return true;
    } else {
      return false;
    }
  } catch (error) {
    // Handle specific error cases (e.g., network issues, server errors)
    if (kDebugMode) {
      print('Error fetching token: $error');
    }
    return false;
  }
}

  

  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('http://127.0.0.1:8000/api/user',
        options: Options(headers: {'Authorization': 'Bearer $token'})  );
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }

  //register new user
  Future<bool> registerUser(String username, String email, String password) async {
  try {
    final dio = Dio(); 
    final response = await dio.post('http://127.0.0.1:8000/api/register',
        data: {'name': username, 'email': email, 'password': password});

    if (response.statusCode == 201 && response.data != null) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    if (kDebugMode) {
      print('Error registering user: $error');
    }
    return false;
  }
}

  //store order
  // details
  Future<dynamic> orderMedication(
      String date, String day, String time, int doctor, String token) async {
    try {
      var response = await Dio().post('http://127.0.0.1:8000/api/book',
          data: {'date': date, 'day': day, 'time': time, 'doctor_id': doctor},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }

  //retrieve order details
  Future<dynamic> getMedicationsOrder(String token) async {
    try {
      var response = await Dio().get('http://127.0.0.1:8000/api/orders',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200 && response.data != '') {
        return json.encode(response.data);
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }

//logout
  Future<dynamic> logout(String token) async {
    try {
      var response = await Dio().post('http://127.0.0.1:8000/api/logout',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }
}
