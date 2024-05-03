import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:calculator/module/home/data/repository/grid_repository.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';

mixin GridHelper {
  GridRepository repository = GridRepository();

  Widget onFirstRow(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onFirstRowClick(i, provider),
            child: Text(Exp.specialExp[i].specialExp)));
  }

  Widget onLastColumn(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onClickOfOperators(i, provider),
            child: Text(Exp.arthExp[i].arithmaticExp.toString())));
  }

  Widget onSpecialCell(int i, HomeViewModel provider) {
    if (i == 17) {
      return Container(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () => repository.onSpecialOperator(i, provider),
              child: const Text('•')));
    } else {
      return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onSpecialOperatorElse(i, provider),
            child: const Text('⌫')),
      );
    }
  }

  Widget onElseCase(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onNumbers(i, provider),
            child: Text(Exp.opsNum[repository.k].opsNumber.toString())));
  }
}
