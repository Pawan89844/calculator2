import 'package:calculator/module/home/data/model/buttons_model.dart';
import 'package:flutter/material.dart';
import '../app_stack/app_stack.dart';
import 'dart:math' as math;

class ShuntingYard {
  // int getPrecendex(String exp) {
  //   for (ArithmaticExpressions operator in Exp.arthExp) {
  //     if (operator.arithmaticExp == exp) {
  //       return operator.precedence;
  //     }
  //   }
  //   return 0;
  // }

  bool isOperator(String token) {
    return Exp.arthExp.any((op) => op.arithmaticExp == token);
  }

  int _precedence(String operatorStack) {
    var precedence = Exp.arthExp
        .firstWhere((element) => element.arithmaticExp == operatorStack);
    return precedence.precedence;
  }

  double calculate(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'x':
        return a * b;
      case '÷':
        return a / b;
      default:
        throw Exception('Invalid Operator');
    }
  }

  // bool isOperator(String char){
  //  return Exp.arthExp.contains(char);
  // }

  // evaluate(String expression) {
  //   final outputStack = [];
  //   final inputStack = [];
  //   final tokens = expression.split(' ');
  //   print('Join: $tokens');
  //   for (final token in tokens) {
  //     if (RegExp(r'[0-9]').hasMatch(token)) {
  //       outputStack.add(token);
  //     } else if (token == '(') {
  //       inputStack.add(token);
  //     } else if (token == ')') {
  //       while (inputStack.isNotEmpty && inputStack.last != '(') {
  //         outputStack.add(inputStack.removeLast());
  //       }
  //       inputStack.removeLast();
  //     } else if (isOperator(token)) {
  //       while (inputStack.isNotEmpty &&
  //           isOperator(inputStack.last) &&
  //           _precedence(inputStack.last) >= _precedence(token)) {
  //         outputStack.add(inputStack.removeLast());
  //       }
  //       inputStack.add(token);
  //     }
  //   }
  //   while (inputStack.isNotEmpty) {
  //     outputStack.add(inputStack.removeLast());
  //   }
  //   final stack = [];
  //   for (final element in outputStack) {
  //     if (element is int) {
  //       stack.add(element);
  //     } else {
  //       final b = stack.removeLast();
  //       final a = stack.removeLast();
  //       stack.add(calculate(a, b, element as String));
  //     }
  //   }
  //   if (stack.length != 1) {
  //     throw Exception('Invalid expression');
  //   }
  //   return stack.first;
  // }

  evaluate(String expression) {
    ADTStack outputStack = ADTStack();
    ADTStack operator_stack = ADTStack();
    final List<String> tokens = expression.split(' ');
    for (int i = 0; i < tokens.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(tokens[i])) {
        outputStack.push(tokens[i]);
        outputStack.printList();
      } else if (tokens[i] == '(') {
        operator_stack.push(tokens[i]);
      } else if (tokens[i] == ')') {
        while (operator_stack.isNotEmpty && operator_stack.last != '(') {
          outputStack.push(operator_stack.pop());
        }
        operator_stack.pop();
      } else if (isOperator(tokens[i])) {
        while (operator_stack.isNotEmpty &&
            isOperator(operator_stack.last) &&
            _precedence(operator_stack.last) >= _precedence(tokens[i])) {
          outputStack.push(operator_stack.pop());
        }
        operator_stack.push(tokens[i]);
      }
    }
    while (operator_stack.isNotEmpty) {
      outputStack.push(operator_stack.pop());
    }
    final stack = [];
    // final b = stack.removeLast();
    // final a = stack.removeLast();
    // stack.add(calculate(a, b, op))
    // return outputStack.last;

    // outputStack.printList();
    // operator_stack.printList();
  }

  // List<String> evaluate(String expression){
  //   List<String> output = [];
  //   Queue<String> operators = Queue<String>();
  //   // ADTStack inputStack = ADTStack();
  //   // ADTStack outputStack = ADTStack();
  //   final List<String> tokens = expression.split(' ');

  //   for(String token in tokens){
  //     if(RegExp(r'[0-9]').hasMatch(token)){
  //       output.add(token);
  //     } else if(token == '('){
  //       operators.addLast(token);
  //     } else if(token == ')'){
  //       while(operators.isNotEmpty && operators.last != '('){
  //         output.add(operators.removeLast());
  //       }
  //       operators.removeLast();
  //     }else{
  //       while(operators.isNotEmpty && getPrecendex(operators.last) >= getPrecendex(token)){
  //         output.add(operators.removeLast());
  //       }
  //       operators.addLast(token);
  //     }
  //   }
  //   while(operators.isNotEmpty){
  //     output.add(operators.removeLast());
  //   }
  //   return output;

  //   // for(final token in tokens){
  //   //   if(double.tryParse(token) != null){
  //   //     outputStack.push(double.parse(token));
  //   //   } else if(token == '('){
  //   //     inputStack.push(token);
  //   //   }else if(token == ')'){
  //   //     while (inputStack.isNotEmpty && inputStack.last != '(') {
  //   //       outputStack.push(inputStack.pop());
  //   //     }
  //   //     inputStack.pop();
  //   //   } else if(_isOperator(token)){

  //   //   }
  //   // }
  // }
}
