import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  bool switchValue = false;
  changeSwitchValue( bool t){
    switchValue = t;
    notifyListeners();
  }
}