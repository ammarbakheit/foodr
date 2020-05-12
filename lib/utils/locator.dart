
import 'package:foodr/Providers/UserProvider.dart';
import 'package:foodr/services/UserServices.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => UserProvider());

  locator.registerLazySingleton(() => UserServices());
}