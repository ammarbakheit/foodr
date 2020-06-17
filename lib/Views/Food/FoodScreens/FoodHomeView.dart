import 'package:flutter/material.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';
import 'package:foodr/Providers/CartProvider.dart';
import 'package:foodr/Providers/FoodProvider.dart';
import 'package:foodr/Views/Food/FoodTypesView/FoodTypeView.dart';
import 'package:foodr/Views/Food/SingleFoodView/SingleFoodView.dart';
import 'package:foodr/main.dart';
import 'package:foodr/utils/style.dart';
import 'package:hive/hive.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class FoodHomeView extends StatefulWidget {
  @override
  _FoodHomeViewState createState() => _FoodHomeViewState();
}

class _FoodHomeViewState extends State<FoodHomeView> {
  List items = ["burger", "fries", "juice", "pizza", "cupcake"];

  Widget _buildtypesLoading(int index, List items) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              color: mainColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTypeWidgets(int index, List<String> foodTypes) {
    final foodProvider = Provider.of<FoodProvider>(context);
    return GestureDetector(
      onTap: () {
        foodProvider.getSingleFoodType(foodTypes[index]);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return FoodTypeView(typeIndex: foodTypes[index]);
          }
        ));
      },
          child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/${foodTypes[index]}.png'))
                      ),
            ),
            Text(
              foodTypes[index],
              style: TextStyle(fontWeight: w500, color: mainColor, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBarWidget(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(
                top: 0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2))),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    color: mainColor,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2))),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 140,
              height: 35,
              decoration: BoxDecoration(
                  color: redBgColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0, right: 10),
                    child: Icon(
                      Icons.search,
                      color: blackColor,
                      size: 16,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
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
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("profile");
              },
              child: Container(
                width: 30,
                height: 30,
                child: Center(child: Text('A', style: TextStyle( 
                  fontWeight: w200
                ),)),
                decoration: BoxDecoration(
                  color: mainColor,
                    // image: DecorationImage(
                    //     image: AssetImage("assets/profile.jpg"),
                    //     fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FoodProvider>(context, listen: false).getFoodTypes();
      Provider.of<FoodProvider>(context, listen: false).getMostOrderedFood();
      Provider.of<FoodProvider>(context, listen: false).getTheBestFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: Consumer<FoodProvider>(
        builder: (context, model, child) {
          return Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    forceElevated: true,
                    pinned: true,
                    backgroundColor: bgColor,
                    expandedHeight: 20,
                    title: _appBarWidget(context),
                    // flexibleSpace:  ,
                  ),
                  SliverToBoxAdapter(
                    child: model.foodTypes != null
                        ? Container(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.foodTypes.length,
                              itemBuilder: (context, index) {
                                return _buildTypeWidgets(
                                    index, model.foodTypes);
                              },
                            ),
                          )
                        : Container(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return _buildtypesLoading(index, items);
                              },
                            )),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "الأكثر طلبا",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: w700,
                                    fontSize: 18),
                              ),
                              Text(
                                "عرض المزيد",
                                style:
                                    TextStyle(fontSize: 12, color: mainColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          model.mostOrderedFood != null
                              ? Container(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.mostOrderedFood.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return SingleFoodView(
                                                similarChoices: model.bestFood.firstWhere((Food food) {
                                      return food.name != model.bestFood[index].name;
                                    }),
                                                food: 
                                              model.mostOrderedFood[index],);
                                            }
                                          ));
                                        },
                                                                              child: Container(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  5,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2.3,
                                          margin: EdgeInsets.only(left: 10),
                                          // padding: EdgeInsets.all(10),

                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/${model.mostOrderedFood[index].picPath}',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.black.withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: whiteColor,
                                                      size: 14,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        '${model.mostOrderedFood[index].name}',
                                                        style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 13,
                                                            fontWeight: w700),
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        softWrap: true,
                                                        maxLines: 3,
                                                      ))
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 5),
                                                    child: Text(
                                                      '${model.mostOrderedFood[index].price} SDG',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: whiteColor),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10))),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 24,
                                              height: 24,
                                              child: LoadingIndicator(
                                                indicatorType: Indicator
                                                    .ballClipRotateMultiple,
                                                color: mainColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              "أفضل العروض",
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 16,
                                  fontWeight: w700),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: model.bestFood != null
                        ? SliverChildBuilderDelegate((context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(model.bestFood[index].name);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return SingleFoodView(
                                    similarChoices: model.bestFood.firstWhere((Food food) {
                                      return food.name != model.bestFood[index].name;
                                    }),
                                    food: cartProvider.cartItems.firstWhere((Food food) {
                                     return food.name == model.bestFood[index].name;
                                    },orElse: () {
                                      return model.bestFood[index];
                                    } )  ,
                                  );
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
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
                                              '${model.bestFood[index].price} SDG',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: grayColor,
                                                  fontSize: 11),
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
                                              '${model.bestFood[index].name}',
                                              style: TextStyle(
                                                  color: blackColor,
                                                  fontWeight: w700,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              '${model.bestFood[index].type}',
                                              style: TextStyle(
                                                  color: grayColor,
                                                  fontSize: 10),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/${model.bestFood[index].picPath}'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }, childCount: model.bestFood.length)
                        : SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 120,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: LoadingIndicator(
                                            indicatorType: Indicator
                                                .ballClipRotateMultiple,
                                            color: mainColor,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, childCount: 4),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0), Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
