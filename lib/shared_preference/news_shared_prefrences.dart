import 'package:shared_preferences/shared_preferences.dart';

class NewsSharedPreferences {
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