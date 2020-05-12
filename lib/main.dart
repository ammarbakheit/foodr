import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/Views/Authentication/AccountValidation/AccountValidation.dart';
import 'package:foodr/Views/Authentication/signup/RegisterationMethodView.dart';
import 'package:foodr/Views/Splash/SplashScreenView.dart';
import 'package:foodr/utils/locator.dart';
import 'package:foodr/utils/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'Views/Authentication/authenticationMethod/AuthenticationChoicesView.dart';
import 'Views/Authentication/signin/SigninView.dart';
import 'Views/Authentication/signup/emailSignup/emailSignupView.dart';
import 'Views/Authentication/signup/phoneNumberSingup/phoneNumberSingup.dart';
void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator<UserProvider>(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale('ar', 'AE'),
        debugShowCheckedModeBanner: false,
        title: 'Foodr',
        theme: ThemeData(
          // canvasColor: mainColor,
          fontFamily: montserrat,
        ),
        home: SplashScreenView(),
        routes: <String, WidgetBuilder>{
          "/postSplash": (BuildContext context) => AuthenticationChoicesView(),
          "/registerationMethod": (BuildContext context) =>
              RegisterationMethodView(),
          "/emailSignup": (BuildContext context) => EmailSignupView(),
          "/phoneNumbersignup": (BuildContext context) =>
              PhoneNumberSignupView(),
          "/signin": (BuildContext context) => SigninView(),
          "/accountValidation": (BuildContext context) => AccountValidationview(),
          "/home": (BuildContext context) => Home(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserProvider>(
        builder: (context, model, child) {
          return Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: model.isLoading == true
                      ? Container(
                          width: 40,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballClipRotateMultiple,
                            color: mainColor,
                          ),
                        )
                      : FlatButton(
                          onPressed: () async {
                            await Provider.of<UserProvider>(context, listen: false)
                                .logout();
                             Navigator.of(context).pushReplacementNamed("/registerationMethod");
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                ),

                Text(model.user.email ?? ""), 
                Text(model.user.phoneNumber ?? ""),
                Text(model.user.password),
                Text(model.user.fullName)
              ],
            ),
          );
        },
      ),
    );
  }
}
