import 'package:flutter/material.dart';
import 'package:foodr/Models/User.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/utils/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class PhoneNumberSignupView extends StatefulWidget {
  @override
  _PhoneNumberSignupViewState createState() => _PhoneNumberSignupViewState();
}

class _PhoneNumberSignupViewState extends State<PhoneNumberSignupView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _autoValidate = false;

  String _name;
  String _phoneNumber;
  String _password;

  bool _obsecureText = true;

  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  String usernameVaildator(String arg) {
    if (arg.length < 3) {
      return "يجب أن يكون الأسم أكثر من حرفين";
    }
    return null;
  }

  String emailValidator(String value) {
    if (value.length < 10)
      return 'يجب أن يكون رقم الهاتف أكثر من 9 أرقام';
    else
      return null;
  }

  String passwordValidator(String arg) {
    if (arg.length < 6) {
      return "كلمة السر يجب أن تكون أكثر من 5 عناصر";
    }
    return null;
  }

  Widget _usernameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("الإسم بالكامل", style: TextStyle(fontWeight: w900, fontSize: 12)),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          decoration: BoxDecoration(
              color: redBgColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextFormField(
              validator: usernameVaildator,
              onSaved: (String value) {
                _name = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        )
      ],
    );
  }

  Widget _phoneNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("رقم الهاتف", style: TextStyle(fontWeight: w900, fontSize: 12)),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          decoration: BoxDecoration(
              color: redBgColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: emailValidator,
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "+249",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: w900),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _passwordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("كلمة السر", style: TextStyle(fontWeight: w900, fontSize: 12)),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          decoration: BoxDecoration(
              color: redBgColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  validator: passwordValidator,
                  onSaved: (value) {
                    _password = value;
                  },
                  obscureText: _obsecureText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              GestureDetector(
                onTap: () => toggle(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.remove_red_eye,
                    color: _obsecureText == true ? mainColor : grayColor,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: -40,
          left: 140,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Positioned(
          top: -40,
          left: -100,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(90)),
          ),
        ),
        Consumer<UserProvider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 120,
                    ),
                    Text(
                      "أنشاء",
                      style: TextStyle(
                          fontSize: 30, fontWeight: w900, color: blackColor),
                    ),
                    Text(
                      "حسابك",
                      style: TextStyle(fontSize: 30, fontWeight: w900),
                    ),
                    Center(
                      child: Form(
                        key: _formkey,
                        autovalidate: _autoValidate,
                        onChanged: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            _usernameWidget(),
                            SizedBox(
                              height: 30,
                            ),
                            _phoneNumberWidget(),
                            SizedBox(
                              height: 30,
                            ),
                            _passwordWidget(),
                            SizedBox(
                              height: 30,
                            ),
                            model.isLoading == true
                                ? Container(
                                    width: 40,
                                    child: LoadingIndicator(
                                      indicatorType:
                                          Indicator.ballClipRotateMultiple,
                                      color: mainColor,
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: mainColor,
                                        onPressed: () async {
                                          if (_formkey.currentState
                                              .validate()) {
                                            _formkey.currentState.save();

                                            bool phoneNumberSignupResponse =
                                                await model.signup(User(
                                                    fullName: _name,
                                                    phoneNumber: _phoneNumber,
                                                    password: _password));

                                            if (phoneNumberSignupResponse ==
                                                true) {
                                              Navigator.of(context)
                                                  .pushReplacementNamed("/accountValidation");
                                            } else {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "حدث خطأ حاول مجددا",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                backgroundColor: mainColor,
                                              ));
                                            }
                                          } else {
                                            setState(() {
                                              _autoValidate = true;
                                            });
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1, color: whiteColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "إنشاء حساب",
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: w800),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("لديك حساب بالفعل ؟"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed("/signin");
                                            },
                                            child: Text(
                                              " تسجيل الدخول",
                                              style: TextStyle(
                                                  fontWeight: w900,
                                                  color: mainColor),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
