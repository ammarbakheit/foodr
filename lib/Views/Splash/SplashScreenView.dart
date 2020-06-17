import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/Views/logo/logo.dart';
import 'package:foodr/utils/style.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  _startTime() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, navigateToSecondPage);
  }

  void navigateToSecondPage() async{
    var userProvider =  Provider.of<UserProvider>(context, listen: false);
    var userChcker = await userProvider.checkUser();
    if(userChcker == true) {
        Navigator.of(context).pushReplacementNamed("/foodhomeView");
    }else {
    Navigator.of(context).pushReplacementNamed("/postSplash");

    }
    //  Navigator.of(context).pushReplacementNamed("/postSplash");
  }
  @override
  void initState() {
    super.initState();
    _startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: mainColor),
          ),
          Positioned(
            bottom: -200,
            left: -180,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            bottom: 84,
            left: -66,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
         logo()
        ],
      ),
    );
  }
}
