import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/sharedpreferences/storage_manager.dart';


class ThemeStarWarsAppNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: YELLOW_STARWARS_MATERIAL,
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: YELLOW_STARWARS),
      ),
    primaryIconTheme: IconThemeData(color: YELLOW_STARWARS),
    accentIconTheme: IconThemeData(color:YELLOW_STARWARS),
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: YELLOW_STARWARS,
    dividerColor: YELLOW_STARWARS,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: YELLOW_STARWARS),
      headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      caption: TextStyle(color: Colors.black, fontSize: 12),
    )
  );

  final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    primaryIconTheme: IconThemeData(color: Colors.black),
    accentIconTheme: IconThemeData(color:Colors.black),
    dividerColor: Colors.black26,
    textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        caption: TextStyle(color: Colors.black, fontSize: 12),
      )
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeStarWarsAppNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'dark';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  bool isLightTheme() {
    return (_themeData == lightTheme);
  }

  void switchTheme() async{
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'dark';
      if (themeMode == 'light') {
        _themeData = darkTheme;
        StorageManager.saveData('themeMode', 'dark');
      } else {
        _themeData = lightTheme;
        StorageManager.saveData('themeMode', 'light');
      }
      notifyListeners();
    });

  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}