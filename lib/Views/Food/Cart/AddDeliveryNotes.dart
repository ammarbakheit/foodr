import 'package:flutter/material.dart';
import 'package:foodr/utils/style.dart';

class AddDeliveryNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 10,
                        fontSize: 22,
                        fontWeight: w900,
                      ),
                      keyboardType: TextInputType.number,
                      // validator: emailValidator,
                      // onSaved: (value) {
                      //   _email = value;
                      // },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: blackColor,
                      size: 28,
                    ),
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
