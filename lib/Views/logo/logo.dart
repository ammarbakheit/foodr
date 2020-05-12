import 'package:flutter/cupertino.dart';
import 'package:foodr/utils/style.dart';

Widget logo() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text:
                "Food",
                style: TextStyle(
                    fontWeight: w900, fontSize: 28, color: whiteColor),
              ),
              TextSpan(
                text:
                "r",
                style: TextStyle(fontWeight: w900, fontSize: 28, color: blackColor),
              )
            ])),
          ],
        ),
      ],
    ),
  );
}
