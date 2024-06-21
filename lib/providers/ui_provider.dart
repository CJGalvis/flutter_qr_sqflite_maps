import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOption = 0;

  int get selectedMenuOption {
    return _selectedMenuOption;
  }

  set selectedMenuOption(int value) {
    _selectedMenuOption = value;
    notifyListeners();
  }
}
