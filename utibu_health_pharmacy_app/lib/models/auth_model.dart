import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
   bool  _isLogin = false;
   bool get isLogin{
   return _isLogin;}

  Map<String, dynamic> user = {}; 
 void loginSuccess(
 ){
    _isLogin = true;

    //update all these data when login
    // user = userData;
    // medication = orderInfo;
    // if (user['details']['fav'] != null) {
    //   _fav = json.decode(user['details']['fav']);
    }




}
