import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/constants/constants.dart';
import 'package:flutter_task_project/core/init/theme/model/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeData _themeData;
  final _themePreference = "theme_preference";

  ThemeManager() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    int prefTheme = sharedPreference.getInt(_themePreference);

    if (prefTheme == null) {
      Brightness systemTheme = WidgetsBinding.instance.window.platformBrightness;
      prefTheme = 0;
      _themeData = appThemeData[AppTheme.values[prefTheme]];
      setTheme(AppTheme.light);
    }
    else if(prefTheme==0) isLightOrDark=true;
    else if(prefTheme==1) isLightOrDark=false;

    _themeData = appThemeData[AppTheme.values[prefTheme]];
    notifyListeners();
  }

  ThemeData get themeData {
    if (_themeData == null) {
      _themeData = appThemeData[AppTheme.light];
    }
    return _themeData;
  }

  setTheme(AppTheme theme) async {
    _themeData = appThemeData[theme];
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themePreference, AppTheme.values.indexOf(theme));
    notifyListeners();
  }
  Future<int> getTheme()async{
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    int prefTheme = sharedPreference.getInt(_themePreference);

    return prefTheme;
  }
  Future<bool> isThemeDark()async{
    bool isDark=false;
    int a=await getTheme();
    (a==1)? isDark=true : isDark=false;

    return isDark;
  }

  Future<String> whichThemePicked()async{
    String themeName;
    int themeValue=await getTheme();
    if(themeValue==0) themeName= "light";
    else if(themeValue==1) themeName= "dark";

    return themeName;
  }
  bool homeViewJobListVisibleOff=false;
  void changeVisible(){
    homeViewJobListVisibleOff=true;
    notifyListeners();
  }
}
