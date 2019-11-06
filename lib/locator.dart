import 'package:get_it/get_it.dart';
import 'core/viewmodel/category_viewmodel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => CategoryViewModel());

//   locator.registerFactory(() => CategoryViewModel());
}
