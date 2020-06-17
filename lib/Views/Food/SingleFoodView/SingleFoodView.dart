import 'package:flutter/material.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';
import 'package:foodr/Providers/CartProvider.dart';
import 'package:foodr/Providers/FoodProvider.dart';
import 'package:foodr/utils/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class SingleFoodView extends StatefulWidget {
  final Food food;
  final Food similarChoices;
  const SingleFoodView({Key key, this.food, this.similarChoices})
      : super(key: key);
  @override
  _SingleFoodViewState createState() => _SingleFoodViewState();
}

class _SingleFoodViewState extends State<SingleFoodView> {
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
        // appBar: AppBar(),
        body: PageStorage(
      bucket: bucket,
      child: Consumer<FoodProvider>(
        builder: (context, model, child) {
          return Stack(
            children: <Widget>[
              Positioned(
                top:0, 
                child: Container(
                    // height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/${widget.food.picPath}'),
                          fit: BoxFit.cover
                          ),
                    )),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: mainColor,
                            size: 26,
                          ),
                          Text(
                            widget.food.name,
                            style: TextStyle(fontSize: 24, fontWeight: w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  model.increaseQuantity(widget.food);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                              Text(widget.food.quantatity.toString()),
                              // Text(
                              //   cartProvider.cartItems.contains(widget.food)
                              //     ? cartProvider.cartItems
                              //         .firstWhere((Food food) {
                              //           return food.name == widget.food.name;
                              //         })
                              //         .quantatity
                              //         .toString()
                              //     : widget.food.quantatity.toString()),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      model.decreaseQuantity(widget.food);
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '${widget.food.price.toString()} SDG',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: w800,
                                color: mainColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Similar Choices",
                            style: TextStyle(fontSize: 18, fontWeight: w800),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return SingleFoodView(
                                  food: widget.similarChoices,
                                  similarChoices: widget.food,
                                );
                              }));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height: MediaQuery.of(context).size.height / 7,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          1, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, right: 10),
                                          child: Text(
                                            '${widget.similarChoices.price}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                color: grayColor, fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            '${widget.similarChoices.name}',
                                            style: TextStyle(
                                                color: blackColor,
                                                fontWeight: w700,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            '${widget.similarChoices.type}',
                                            style: TextStyle(
                                                color: grayColor, fontSize: 10),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "4.6",
                                                style: TextStyle(
                                                    color: mainColor,
                                                    fontSize: 10),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: mainColor,
                                                size: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/${widget.similarChoices.picPath}'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      cartProvider.isLoading == true
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 24,
                                  child: LoadingIndicator(
                                    indicatorType:
                                        Indicator.ballClipRotateMultiple,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  color: mainColor,
                                  onPressed: () {
                                    cartProvider.cartItems.any((Food food) {
                                      return food.name == widget.food.name;
                                    })
                                        ? print("added")
                                        : cartProvider.addToCart(widget.food);
                                  },
                                  shape: RoundedRectangleBorder(
                                    // side: BorderSide(width: 1, color: whiteColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    cartProvider.cartItems.any((Food food) {
                                      return food.name == widget.food.name;
                                    })
                                        ? " added"
                                        : "add to cart",
                                    style: TextStyle(
                                        color: whiteColor, fontWeight: w900),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                      size: 28,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
