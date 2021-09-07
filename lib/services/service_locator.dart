import 'dart:ffi';

import 'package:get_it/get_it.dart';
import 'package:new_app_flutter/shared_preference/news_shared_prefrences.dart';
import 'package:new_app_flutter/ui/welcome/welcome_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.I;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => NewsSharedPreferences());

  serviceLocator.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
}

