import 'dart:math';

import 'package:flutter/material.dart';

class Calcular extends ChangeNotifier {
  final binaryController = TextEditingController();

  String binaryNum = '0';

  int decimal = 0;

  String errorTxt = '';

  void onConverter(String num1) {
    if (num1 == '') {
      errorTxt = 'O campo nao pode ficar vazio!';

      notifyListeners();
    } else {
      binaryNum = num1;
      for (int i = binaryNum.length - 1; i >= 0; i--) {
        decimal +=
            int.parse(binaryNum[i]) * pow(2, binaryNum.length - 1 - i) as int;
      }
      binaryNum;
      decimal;
      errorTxt = '';
      notifyListeners();
    }
  }

  void onClear() {
    binaryNum = '0';
    decimal = 0;
    notifyListeners();
  }
}
