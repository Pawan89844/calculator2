import 'package:calculator/module/home_logic.dart';
import 'package:calculator/module/home_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin HomeHelper {
  int j = -1;
  int k = -1;
  List<int> numbers = [7, 8, 9, 4, 5, 6, 1, 2, 3, 0];
  List<String> operators = ['÷', 'x', '-', '+', '='];
  List<String> operator = ['AC', '%', '()'];

  @kDebugMode
  void incrK() {
    if (k < 9) {
      k++;
    } else {
      k = -1;
      k++;
    }
  }

  @kDebugMode
  void incrJ() {
    if (j < 4) {
      j++;
    } else {
      j = -1;
      j++;
    }
  }

  int digitIndex(int i) {
    if (i == 4) {
      return 0;
    } else if (i == 5) {
      return 1;
    } else if (i == 6) {
      return 2;
    } else if (i == 8) {
      return 3;
    } else if (i == 9) {
      return 4;
    } else if (i == 10) {
      return 5;
    } else if (i == 12) {
      return 6;
    } else if (i == 13) {
      return 7;
    } else if (i == 14) {
      return 8;
    } else {
      return 9;
    }
  }

  Widget onFirstRow(int i, BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              var provider = Provider.of<HomeViewModel>(context, listen: false);
              if (operator[i] == 'AC') {
                provider.clear();
              }
            },
            child: Text(operator[i])));
  }

  Widget onLastColumn(int i, BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              var provider = Provider.of<HomeViewModel>(context, listen: false);
              provider.inputValue = operators[i];
            },
            child: Text(operators[i].toString())));
  }
}
