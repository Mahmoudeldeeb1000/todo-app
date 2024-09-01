import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
class ThemeProvider extends ChangeNotifier{
  bool switchValue = false;


  setSwitchValueFromHive( ) {
    var box= Hive.box("settingsBox");
    switchValue = box.get("switchValue") ?? false ;
    notifyListeners();
  }

  changeSwitchValue( bool t)async{
    await Hive.box("settingBox").put("switchValue",t);
    switchValue = Hive.box("settingBox").get("switchValue");
    notifyListeners();
  }
}