import 'package:foodr/Models/FoodModels/Burger.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';

class FoodServices {

  Future<List<String>> fetchFoodTypesService() async {
      return ["burger", "fries", "juice", "pizza", "cupcake"];
  }

  Future<List<Food>> fetchMostOrderedFoodService() async {
    return [
      Food(name: "double Cheese Burger", type: "burger", price: 300, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Fresh Fries", type: "fries", price: 200, picPath: "friesBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Mango Juice", type: "juice", price: 100, picPath: "juiceBg.jpg", quantatity: 1, favourite: false),
      Food(name: " Burger King", type: "burger", price: 450, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Chocolate CupCake", type: "cupcake", price: 190, picPath: "cupcakeBg.jpg", quantatity: 1, favourite: false),
    ];
  }

  Future<List<Food>> fetchBestFoodService() async {
    return [
      Food(name: "double Cheese Burger", type: "burger", price: 300, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Fresh Fries", type: "fries", price: 200, picPath: "friesBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Mango Juice", type: "juice", price: 100, picPath: "juiceBg.jpg", quantatity: 1, favourite: false),
      Food(name: " Burger King", type: "burger", price: 450, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Chocolate CupCake", type: "cupcake", price: 190, picPath: "cupcakeBg.jpg", quantatity: 1, favourite: false),
      Food(name: "double Cheese Burger", type: "burger", price: 300, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Fresh Fries", type: "fries", price: 200, picPath: "friesBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Mango Juice", type: "juice", price: 100, picPath: "juiceBg.jpg", quantatity: 1, favourite: false),
      Food(name: " Burger King", type: "burger", price: 450, picPath: "burgerBg.jpg", quantatity: 1, favourite: false),
      Food(name: "Chocolate CupCake", type: "cupcake", price: 190, picPath: "cupcakeBg.jpg", quantatity: 1, favourite: false),
    ];
  }


}