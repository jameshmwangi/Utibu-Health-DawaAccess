import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
   bool  _isLogin = false;
   Map<String, dynamic> medication =
      {};
   bool get isLogin{
   return _isLogin;}

  Map<String, dynamic> user = {}; 
   Map<String, dynamic> get getUser {
    return user;
  }
 void loginSuccess(

   Map<String, dynamic> userData, Map<String, dynamic> orderInfo) {
    
    _isLogin = true;

    //update all these data when login
    user = userData;
    medication = orderInfo;
   
    }





}
