import 'package:flutter/material.dart';
import 'package:foodr/Providers/CartProvider.dart';
import 'package:foodr/Providers/FoodProvider.dart';
import 'package:foodr/utils/style.dart';
import 'package:provider/provider.dart';

class CartHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var foodProvider = Provider.of<FoodProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "السلة",
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: blackColor,),
          //   onPressed: () {

          //   },
          // )
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, model, child) {
          if (model.cartItems.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "سلتك فارغة",
                    style: TextStyle(
                        color: mainColor, fontSize: 20, fontWeight: w900),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "أضف بعض الأصناف",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            );
          }

          if (model.cartItems.length > 0) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: ListView.builder(
                      itemCount: model.cartItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          // height: 65,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(1, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: mainColor,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        model
                                            .removeItem(model.cartItems[index]);
                                      },
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '${model.cartItems[index].name}   ${model.cartItems[index].price} x ${model.cartItems[index].quantatity}',
                                      style: TextStyle(
                                          color: grayColor, fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            foodProvider.increaseQuantity(
                                                model.cartItems[index]);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: redBgColor),
                                            child: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: mainColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            foodProvider.decreaseQuantity(
                                                model.cartItems[index]);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: redBgColor),
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: mainColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${model.cartItems[index].price * model.cartItems[index].quantatity} SDG',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: blackColor, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  decoration: BoxDecoration(
                  color: whiteColor,
                     borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("تريد المزيد !"),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            color: mainColor,
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushReplacementNamed("/foodView");
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: whiteColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "أضف",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: whiteColor,
                                      fontWeight: w800),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.add,
                                  color: whiteColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("ملاحظات للتوصيل !"),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            color: mainColor,
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushNamed("/addDeliveryNote");
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: whiteColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "أضف ملاحظاتك",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: whiteColor,
                                      fontWeight: w800),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.add,
                                  color: whiteColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "الإجمالي",
                          ),
                          Text(
                            '${model.cartItems.fold(0, (total, current) => total + current.price * current.quantatity)} SDG',
                            textDirection: TextDirection.ltr,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        color: mainColor,
                        onPressed: () async {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: whiteColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "أشتري",
                              style: TextStyle(
                                  color: whiteColor, fontWeight: w800),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
