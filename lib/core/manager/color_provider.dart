import 'package:evaluation_and_follow_up/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../helper/SharedPreferences/pref.dart';

class ColorProvider with ChangeNotifier {
  Color _currentColor = const Color(0xff4EA74F); // اللون الافتراضي

  Color get currentColor => _currentColor;

  Future<void> loadColor() async {
    final int? colorValue =
        await Pref.getIntFromPref(key: AppStrings.primaryColorKey);
    _currentColor =
        colorValue != null ? Color(colorValue) : const Color(0xff4EA74F);
    notifyListeners(); // إبلاغ المستمعين بحدوث تغيير
  }

  Future<void> changeColor(int colorValue) async {
    _currentColor = Color(colorValue);
    Pref.saveIntToPref(key: AppStrings.primaryColorKey, value: colorValue);

    notifyListeners(); // إبلاغ المستمعين بحدوث تغيير
  }
}
