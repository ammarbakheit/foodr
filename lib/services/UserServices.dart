import 'package:foodr/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'dart:io';

class UserServices {
  Future<User> checkloggedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool loggedIn =  preferences.getBool("LoggedIn");
    String fullName =    preferences.getString("fullname");
    String email =    preferences.getString("email");
    String password =    preferences.getString("password");
    String phoneNumber = preferences.getString("phoneNumber");
    print(loggedIn);
    if (loggedIn == true) {
      return User(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber ?? null,
        password: password
      );
    } else {
      return null;
    }
  }

  Future<bool> signupWithEmailService(User user) async {
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      await preferences.clear();
      await preferences.setString("fullname", user.fullName);
      await preferences.setString("email", user.email);
      await preferences.setString("password", user.password);
    
      await preferences.setBool("LoggedIn", true);
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> signupWithPhoneNumberService(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      await preferences.clear();
      await preferences.setString("fullname", user.fullName);
      await preferences.setString("password", user.password);
      await preferences.setString("phoneNumber", user.phoneNumber);
      await preferences.setBool("LoggedIn", true);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signinWithEmailService(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
    String password =    preferences.getString("password");
    String email = preferences.getString("email");
    print(password);
    print(email);
    if(email == user.email && password == user.password) {
       await preferences.setBool("LoggedIn", true);
      return true;
    } 
    } catch (e) {
      return false;
    }
  }

  Future<bool> signinWithPhoneNumberService(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
    String password =    preferences.getString("password");
    String phoneNumber = preferences.getString("phoneNumber");
    await preferences.setBool("LoggedIn", true);
    print(password);
    print(phoneNumber);
    if(phoneNumber == user.phoneNumber && password == user.password) {
      return true;
    } 
    } catch (e) {
      return false;
    }
  }

  Future<bool> logoutService() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
   bool loggedOut = await preferences.setBool("loggedIn", false);
   if(loggedOut) {
     
     return true;
   } else {
     return false;
   }
  }

  Future<bool> accountValidationService() async {
    return true;
  }
}
