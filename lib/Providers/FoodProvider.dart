import 'package:flutter/cupertino.dart';
import 'package:foodr/Models/FoodModels/Food/Food.dart';
import 'package:foodr/services/FoodServices/FoodServices.dart';
import 'package:foodr/utils/locator.dart';

class FoodProvider extends ChangeNotifier {
  FoodProvider() {
    getFoodTypes();
  }

  final foodServices = locator<FoodServices>();

  bool _isLoading;
  bool get isLoading => _isLoading;

  List<String> _foodTypes;
  List<String> get foodTypes => _foodTypes;

  List<Food> _mostOrderedFood;
  List<Food> get mostOrderedFood => _mostOrderedFood;

  List<Food> _bestFood;
  List<Food> get bestFood => _bestFood;

  List<Food> _singleFoodType;
  List<Food> get singleFoodType => _singleFoodType;

  void getFoodTypes() async {
    _isLoading = true;
    notifyListeners();
    List<String> foodTypes = await foodServices.fetchFoodTypesService();
    await Future.delayed(Duration(seconds: 2));
    _foodTypes = foodTypes;
    _isLoading = false;
    notifyListeners();
  }

  void getSingleFoodType(String foodType) async {
    _isLoading = true;
    notifyListeners();
    List<Food> singleTypeFood = _bestFood.where((Food food) {
      return food.type  == foodType;
    }).toList();
    print(foodType);
    await Future.delayed(Duration(seconds: 2));
    if(singleTypeFood == null) {
      _singleFoodType = null;
    }
    _singleFoodType = singleTypeFood;
    _isLoading = false;
    notifyListeners();
  }

  void getMostOrderedFood() async {
    _isLoading = true;
    notifyListeners();
    List<Food> foodItems = await foodServices.fetchMostOrderedFoodService();
    await Future.delayed(Duration(seconds: 2));
    _mostOrderedFood = foodItems;
    _isLoading = false;
    notifyListeners();
  }

  void getTheBestFood() async {
    _isLoading = true;
    notifyListeners();
    List<Food> foodItems = await foodServices.fetchBestFoodService();
    await Future.delayed(Duration(seconds: 2));
    _bestFood = foodItems;
    _isLoading = false;
    notifyListeners();
  }

  void increaseQuantity(Food food) async {
    food.quantatity++;
    notifyListeners();
  }

  void decreaseQuantity(Food food) async {
    if (food.quantatity > 1) {
      food.quantatity--;
      notifyListeners();
    }
  }
}
