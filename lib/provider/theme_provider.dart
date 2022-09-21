import 'package:flutter/material.dart';

import '../constants/colors.dart' as color_constants;

class ThemeProvider extends ChangeNotifier {
  Color appBarColor = color_constants.redDark;
  Color backgroundColor = color_constants.redPrimary;
  // Todo: icondata, text

  void changeAppBarColor(Color color) {
    appBarColor = color;
    notifyListeners();
  }

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }
}
