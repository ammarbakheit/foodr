
import 'package:foodr/Providers/CartProvider.dart';
import 'package:foodr/Providers/FoodProvider.dart';
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/services/CartServices/CartServices.dart';
import 'package:foodr/services/FoodServices/FoodServices.dart';
import 'package:foodr/services/UserServices.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => UserProvider());
  locator.registerLazySingleton(() => FoodProvider());
  locator.registerLazySingleton(() => CartProvider());

  locator.registerLazySingleton(() => UserServices());
  locator.registerLazySingleton(() => FoodServices());
  locator.registerLazySingleton(() => CartServices());
}