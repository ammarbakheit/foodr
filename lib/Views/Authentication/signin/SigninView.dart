import 'package:flutter/material.dart';
import 'package:foodr/Models/User.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/utils/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _autoValidate = false;


  String _email;
  String _password;

  bool _obsecureText = true;

  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }


  String emailValidator(String value) {
   
    if (value.length < 5)
      return 'الإيميل أو رقم الهاتف غير صحيح';
    else
      return null;
  }

  String passwordValidator(String arg) {
    if (arg.length < 6) {
      return "كلمة السر يجب أن تكون أكثر من 5 عناصر";
    }
    return null;
  }



  Widget _emailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" الإيميل أو رقم الهاتف", style: TextStyle(fontWeight: w900, fontSize: 12)),
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
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              onSaved: (value) {
                _email = value;
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
      backgroundColor: whiteColor,
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
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    "تسجيل",
                    style: TextStyle(
                        fontSize: 30, fontWeight: w900, color: blackColor),
                  ),
                  Text(
                    "دخول",
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
                          _emailWidget(),
                          SizedBox(
                            height: 30,
                          ),
                          _passwordWidget(),
                          SizedBox(
                            height: 30,
                          ),
                        model.isLoading == true ? 
                        Container(
                                      width: 40,
                                      child: LoadingIndicator(
                                        indicatorType:
                                            Indicator.ballClipRotateMultiple,
                                        color: mainColor,
                                      ),
                                    )
                         :  Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                color: mainColor,
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    _formkey.currentState.save();
                                 bool signinResponse = await   model.signin(User(
                                      email: _email,
                                      password: _password
                                    ));

                                    if(signinResponse == false) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("حدث خطأ حاول مجددا", style: TextStyle(
                                          fontSize: 15
                                        ),),
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
                                  side: BorderSide(width: 1, color: whiteColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  " نسجيل دخول",
                                  style: TextStyle(
                                      color: whiteColor, fontWeight: w800),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Text("ليس لديك حساب  ؟"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector( 
                                    onTap: () {
                                      Navigator.of(context).pushReplacementNamed("/registerationMethod");
                                    },
                                    child: Text(
                                      " أنشئ حسابك",
                                      style: TextStyle(
                                          fontWeight: w900, color: mainColor),
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
        )  ,
        ],
      ),
    );
  }
}
