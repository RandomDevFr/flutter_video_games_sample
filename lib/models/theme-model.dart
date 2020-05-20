import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isBright = true;
  bool get isBright => _isBright;
  ThemeData get brightTheme => _getBrightTheme();
  ThemeData get darkTheme => _getDarkTheme();

  void toggle() {
    _isBright = !_isBright;
    notifyListeners();
  }

  ThemeData _getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.deepOrange[700],
      disabledColor: Colors.grey[900],
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline5: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange[700]),
      ));
  }
  
 ThemeData _getBrightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.indigo[700],
      scaffoldBackgroundColor: Colors.grey[300],
      accentColor: Colors.white,
      disabledColor: Colors.grey[500],
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[700]),
        headline5: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[700]),
      )
    );
  }
}