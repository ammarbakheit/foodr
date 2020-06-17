import 'package:flutter/material.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';
import 'package:foodr/Providers/CartProvider.dart';
import 'package:foodr/Providers/FoodProvider.dart';
import 'package:foodr/Views/Food/SingleFoodView/SingleFoodView.dart';
import 'package:foodr/utils/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class FoodTypeView extends StatefulWidget {
  final String typeIndex;

  const FoodTypeView({Key key, this.typeIndex}) : super(key: key);
  @override
  _FoodTypeViewState createState() => _FoodTypeViewState();
}

class _FoodTypeViewState extends State<FoodTypeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FoodProvider>(context, listen: false)
          .getSingleFoodType(widget.typeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(body: Consumer<FoodProvider>(
      builder: (context, model, child) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/${widget.typeIndex}Bg.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        widget.typeIndex,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 40,
                            fontWeight: w900,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: MediaQuery.of(context).size.height / 3 -100,
            //   child: Text(widget.typeIndex),
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(36),
                        topLeft: Radius.circular(36))),
                child: model.isLoading == true
                    ? Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballClipRotateMultiple,
                            color: mainColor,
                          ),
                        ),
                      )
                    : model.singleFoodType == null
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballClipRotateMultiple,
                            color: mainColor,
                          ),
                        ),
                      ),
                          ],
                        )
                        : Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: model.singleFoodType.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          print(model.singleFoodType[index].name);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return SingleFoodView(
                                              similarChoices: model.bestFood
                                                  .firstWhere((Food food) {
                                                return food.name !=
                                                    model.bestFood[index].name;
                                              }),
                                              food: cartProvider.cartItems
                                                  .firstWhere((Food food) {
                                                return food.name ==
                                                    model.singleFoodType[index].name;
                                              }, orElse: () {
                                                return model.singleFoodType[index];
                                              }),
                                            );
                                          }));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                120,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            margin: EdgeInsets.only(bottom: 20),
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(1,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20.0,
                                                              right: 10),
                                                      child: Text(
                                                        '${model.singleFoodType[index].price} SDG',
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: TextStyle(
                                                            color: grayColor,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Text(
                                                        '${model.singleFoodType[index].name}',
                                                        style: TextStyle(
                                                            color: blackColor,
                                                            fontWeight: w700,
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        '${model.singleFoodType[index].type}',
                                                        style: TextStyle(
                                                            color: grayColor,
                                                            fontSize: 10),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            "4.6",
                                                            style: TextStyle(
                                                                color:
                                                                    mainColor,
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/${model.singleFoodType[index].picPath}'),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
    ));
  }
}
