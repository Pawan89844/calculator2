import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin GridHelper {
  int j = -1;
  int k = -1;
  // List<int> numbers = [7, 8, 9, 4, 5, 6, 1, 2, 3, 0];
  // List<String> operators = ['÷', 'x', '-', '+', '='];
  // List<String> operator = ['AC', '%', '()'];

  void incrK() {
    if (k < 9) {
      k++;
    } else {
      k = -1;
      k++;
    }
  }

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
              if (Exp.specialExp[i].specialExp == 'AC') {
                provider.clear();
              }
            },
            child: Text(Exp.specialExp[i].specialExp)));
  }

  Widget onLastColumn(int i, BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              var provider = Provider.of<HomeViewModel>(context, listen: false);
              if (provider.userProvidedVal.isNotEmpty &&
                  !provider.userProvidedVal
                      .contains(Exp.arthExp[i].arithmaticExp)) {
                provider.inputValue = Exp.arthExp[i].arithmaticExp;
              }
              if (provider.userProvidedVal
                  .endsWith(Exp.arthExp[i].arithmaticExp)) {
                // provider.inputValue = operators[i];
              }
            },
            child: Text(Exp.arthExp[i].arithmaticExp.toString())));
  }

  Widget onSpecialCell(int i, HomeViewModel provider) {
    if (i == 17) {
      return Container(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {
                if (provider.userProvidedVal.isNotEmpty &&
                    !provider.userProvidedVal.contains('.')) {
                  provider.inputValue = '.';
                }
              },
              child: const Text('•')));
    } else {
      return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              if (provider.userProvidedVal.isNotEmpty) {
                provider.replaceOperator();
              }
            },
            child: const Text('⌫')),
      );
    }
  }

  Widget onElseCase(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              provider.inputValue =
                  Exp.opsNum[digitIndex(i)].opsNumber.toString();
            },
            child: Text(Exp.opsNum[k].opsNumber.toString())));
  }
}
