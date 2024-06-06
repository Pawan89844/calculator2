import 'package:calculator/module/ADT/algorithm/algorithm.dart';
import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class Operations {
  void calculate(HomeViewModel viewModel);
}

class OperationsRepository implements Operations {
  Algorithm algorithm = Algorithm();
//********************************************************************************
  /// The function will perform evaluation using Shunting Yard Algorithm.
//********************************************************************************

  @override
  void calculate(HomeViewModel viewModel) {
    if (viewModel.userProvidedVal.endsWith('=')) {
      viewModel.removeLast();
      double result = algorithm.evaluate(viewModel.userProvidedVal);
      viewModel.outputValue = result.toString();
    }
  }
}
