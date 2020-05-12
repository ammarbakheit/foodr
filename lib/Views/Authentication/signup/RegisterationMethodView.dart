import 'package:flutter/material.dart';
import 'package:foodr/utils/style.dart';
import 'package:google_fonts_arabic/fonts.dart';
class RegisterationMethodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: whiteColor,
          ),
           Positioned(
            top: -20,
            left: -120,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
           Positioned(
            top: -140,
            left: -25,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
           Positioned(
            top: -20,
            left: 120,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            top: 178,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "إختر طريقة",
                    style: TextStyle(
                        fontSize: 30, fontWeight: w800, color: blackColor),
                  ),
                  Text(
                    "إنشاء حسابك",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 30, fontWeight: w800, color: blackColor),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: mainColor,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/phoneNumbersignup");
                  },
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(width: 1, color: whiteColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "  رقم الهاتف",
                    style: TextStyle(color: whiteColor, fontWeight: w900),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: whiteColor,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/emailSignup");
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: mainColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "الايميل الالكتروني",
                    style: TextStyle(color: mainColor, fontWeight: w900),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
