import 'package:flutter/cupertino.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';

class CartProvider extends ChangeNotifier {

  bool _isLoading;
  bool get isLoading => _isLoading;


  List<Food> _cartItems = List<Food>();
  List<Food> get cartItems => _cartItems;

 
  void addToCart(Food food) async {
    _isLoading = true;
    notifyListeners();
    _cartItems.add(food);
    // await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
    print(_cartItems.length);
  }

  void removeItem(Food  food) async {
    _cartItems.remove(food);
    notifyListeners();
  } 
}