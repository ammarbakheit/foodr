import 'package:flutter/material.dart';
import 'package:foodr/Views/logo/logo.dart';
import 'package:foodr/utils/style.dart';

class AuthenticationChoicesView extends StatelessWidget {
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
            top: -180,
            right: -180,
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
            top: -80,
            right: 80,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: -100,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          logo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: whiteColor,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/registerationMethod");

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "إنشاء حساب",
                    style: TextStyle(color: mainColor, fontWeight: w500,  fontFamily: montserrat),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: mainColor,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/signin");
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: whiteColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "تسجيل دخول",
                    style: TextStyle(color: whiteColor, fontWeight: w500),
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
