import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  bool _check_dark = false;
  bool get check_dark => _check_dark;

  setDark(){
    _check_dark = !check_dark;
    notifyListeners();
  }
}