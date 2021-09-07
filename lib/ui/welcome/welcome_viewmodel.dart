

import 'package:flutter/cupertino.dart';

class WelcomeViewModel extends ChangeNotifier {
  var _userNameValid = true;

  bool get userNameValid {
    return _userNameValid;
  }

  void changeUserNameValid(bool value){
    _userNameValid = value;
    notifyListeners();
  }
}