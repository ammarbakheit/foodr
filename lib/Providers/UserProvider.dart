import 'package:flutter/cupertino.dart';
import 'package:foodr/Models/User.dart';
import 'package:foodr/services/UserServices.dart';
import 'package:foodr/utils/locator.dart';

class UserProvider extends ChangeNotifier {
  User _user;
  bool _loggedIn;
  bool _isLoading;
  User get user => _user;
  bool get loggedIn => _loggedIn;
  bool get isLoading => _isLoading;

  final userServices = locator<UserServices>();

  Future<bool> signup(User user) async {
    _isLoading = true;
    notifyListeners();
    if (user.email != null) {
      bool signupService = await userServices.signupWithEmailService(user);
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      if (signupService == true) {
        _user = user;
        notifyListeners();
        print("successfully signup");
        return true;
      } else {
        print("error");
        return false;
      }
    }
    if (user.phoneNumber != null) {
      bool signupService =
          await userServices.signupWithPhoneNumberService(user);
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      if (signupService == true) {
        _user = user;
        print("successfully signup");
        return true;
      } else {
        print("error");
        return false;
      }
    }
  }

  Future<bool> signin(User user) async {
    _isLoading = true;
    notifyListeners();
    if (user.email != null) {
      bool signinService = await userServices.signinWithEmailService(user);
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      if (signinService == true) {
        print("successfuly signed in");
        return true;
      } else {
        print("error");
        return false;
      }
    }

    if (user.phoneNumber != null) {
      bool signinService =
          await userServices.signinWithPhoneNumberService(user);
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      if (signinService == true) {
        print("successfuly signed in");
      } else {
        print("error");
      }
    }
  }

  Future<Object> checkUser() async {
    var checkUser = await userServices.checkloggedUser();
    if (checkUser != null) {
        _user = checkUser;
      _loggedIn = true;
      return true;
    } else {
      _loggedIn = false;
      return false;
    }
  }

  Future<bool> ValidateAccount() async {
    _isLoading = true;
    notifyListeners();

    bool accountValidationService =
        await userServices.accountValidationService();
    await Future.delayed(Duration(seconds: 2));
    
   

    if (accountValidationService == true) {
      _isLoading = false;
       notifyListeners();
      return true;
      
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    bool logoutS = await userServices.logoutService();
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
    if (logoutS == true) {
      print("loggedout");
    } else {
      print("not logged out");
    }
  }
}
