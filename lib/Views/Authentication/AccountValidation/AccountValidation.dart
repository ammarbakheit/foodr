import 'package:flutter/material.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/utils/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class AccountValidationview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Consumer<UserProvider>(
        builder: (context, model, child) {
          return model.isLoading == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 40,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballClipRotateMultiple,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("أدخل رمز التأكيد",
                                style:
                                    TextStyle(fontWeight: w900, fontSize: 12)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 140,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: redBgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: mainColor,
                        onPressed: () async {
                          bool accountValidationResponse =
                              await model.ValidateAccount();
                          if (accountValidationResponse == true) {
                            Navigator.of(context).pushReplacementNamed("/home");
                          }
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: whiteColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "تأكيد",
                          style: TextStyle(color: whiteColor, fontWeight: w500),
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
