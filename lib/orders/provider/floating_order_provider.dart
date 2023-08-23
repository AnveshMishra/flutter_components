import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {}

class FloatingOrderProvider extends ChangeNotifier {
  String test = 'test';

  testFun(String add) {
    test = 'asd' + add;
    notifyListeners();
  }
}
