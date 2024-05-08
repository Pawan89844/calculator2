import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:calculator/module/home/data/repository/grid_repository.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';

mixin GridHelper {
  GridRepository repository = GridRepository();

//************************************************************************************
  ///This method is reserved for Top operation to the UI (Example : AC, %, and ().)
//************************************************************************************
  Widget onFirstRow(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onFirstRowClick(i, provider),
            child: Text(Exp.specialExp[i].specialExp, style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))));
  }

//************************************************************************************
  /// This column is Reserved for Arithmatic operators such as (/, *, -, and =)
//************************************************************************************
  Widget onLastColumn(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onClickOfOperators(i, provider),
            child: Text(Exp.arthExp[i].arithmaticExp.toString(), style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))));
  }

//************************************************************************************
  /// This method is used for Displaying Dot and Backspace only at the bottom.
//************************************************************************************
  Widget onSpecialCell(int i, HomeViewModel provider) {
    if (i == 17) {
      return Container(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () => repository.onSpecialOperator(i, provider),
              child: const Text('•', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))));
    } else {
      return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onSpecialOperatorElse(i, provider),
            child: const Text('⌫', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
      );
    }
  }

//***********************************************************************************************
  /// This case is displaying numbers conditionally for example (0, 1, 2, 3, 4, 5, 6, 7, 8, 9).
//***********************************************************************************************
  Widget onElseCase(int i, HomeViewModel provider) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () => repository.onNumbers(i, provider),
            child: Text(Exp.opsNum[repository.k].opsNumber.toString(), style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))));
  }
}
