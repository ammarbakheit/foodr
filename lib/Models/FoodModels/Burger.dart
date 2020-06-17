import 'package:foodr/Models/FoodModels/Food/Food.dart';

class Burger extends Food {
  String name;
  String picPath;
  int price;
  int quantatity;
  bool favourite;
  Burger(
      {this.name, this.picPath, this.price, this.quantatity, this.favourite});
}
