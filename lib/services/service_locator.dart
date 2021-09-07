import 'dart:ffi';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.I;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => MySharedPreferences());
}

class MySharedPreferences {
  final _userName = "userName";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<String> getUserName() async {
    SharedPreferences prefs = await _prefs;
    //Return String
    String stringValue = prefs.getString(_userName) ?? '';
    return stringValue;
  }

  setUserName(String userName) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(_userName, userName);
  }
}