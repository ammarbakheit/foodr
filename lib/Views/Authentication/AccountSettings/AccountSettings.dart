import 'package:flutter/material.dart';
import 'package:foodr/utils/style.dart';

class AccountSettingsView extends StatefulWidget {
  @override
  _AccountSettingsViewState createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  int _address = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("العنوان الرئيسي"),
                RadioListTile(
                  title: Text("أمدرمان"),
                  value: 0,
                  onChanged: (int newVlaue) {

                  },
                ),
                RadioListTile(
                  title: Text("الخرطوم"),
                  value: 1,
                  onChanged: (int newVlaue) {

                  },
                ),
                RadioListTile(
                  title: Text("بحري"),
                  value: 2,
                  onChanged: (int newVlaue) {

                  },
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                      color: redBgColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("عنوان العمل"),
                TextField()
              ],
            ),
          )
        ],
      ),
    );
  }
}
