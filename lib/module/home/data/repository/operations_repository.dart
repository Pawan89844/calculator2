import 'package:calculator/module/ADT/app_stack/app_stack.dart';
import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class Operations {
  @mustCallSuper
  void add(int i, int digitIndex) {}

  void subtract() {}

  void divide() {}

  void multiply() {}

  void calculate(HomeViewModel viewModel) {}

}

class OperationsRepository implements Operations {
 ADTStack inputStack = ADTStack();
 ADTStack outputStack = ADTStack();

//******************************************************
  /// The function will perform addition operation.
//******************************************************
  @override
  void add(int i, int digitIndex) {
    if (Exp.arthExp[i].arithmaticExp == '+') {
      Exp.opsNum[digitIndex].opsNumber;
    }
  }

  @override
  void calculate(HomeViewModel viewModel) {
    if(viewModel.userProvidedVal.endsWith('=')){
      viewModel.outputValue = viewModel.userProvidedVal;
      viewModel.removeLast();
    }
  }

  @override
  void divide() {
    // TODO: implement divide
  }

  @override
  void multiply() {
    // TODO: implement multiply
  }

  @override
  void subtract() {
    // TODO: implement subtract
  }
  
}
