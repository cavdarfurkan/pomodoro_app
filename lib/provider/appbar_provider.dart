import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier {
  Color appBarColor = Colors.red;
  // Color appBarColor = ThemeData().primaryColor;
  // Todo: icondata, text

  void changeAppBarColor(Color color) {
    appBarColor = color;
    notifyListeners();
  }
}
