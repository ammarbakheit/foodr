import 'package:flutter/material.dart';
import 'package:foodr/Views/Food/Cart/CartHomeView.dart';
import 'package:foodr/Views/Food/FoodScreens/FoodHomeView.dart';
import 'package:foodr/utils/style.dart';

import '../../../main.dart';


class FoodView extends StatefulWidget {
  @override
  _FoodViewState createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  List<Widget> pages = [
    FoodHomeView(),
    CartHomeView(),
    Home(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(children: pages),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height / 15,
            color: mainColor,
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelColor: whiteColor,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(fontSize: 16, fontFamily: montserrat),
              tabs: <Widget>[
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.home,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "الرئيسية",
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_basket,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "السلة",
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.account_box,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "الحساب",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
