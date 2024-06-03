import 'package:calculator/module/home/data/model/buttons_model.dart';

import '../app_stack/app_stack.dart';
import 'dart:math' as math;

class ShuntingYard {
  int getPrecendex(String exp) {
    for (ArithmaticExpressions operator in Exp.arthExp) {
      if (operator.arithmaticExp == exp) {
        return operator.precedence;
      }
    }
    return 0;
  }

  bool isOperator(String token) {
    return Exp.arthExp.any((op) => op.arithmaticExp == token);
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

  evaluate(String expression) {
    ADTStack outputStack = ADTStack();
    ADTStack operator_stack = ADTStack();
    final List<String> tokens = expression.split(' ');
    for (int i = 0; i < tokens.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(tokens[i])) {
        outputStack.push(tokens[i]);
        // outputStack.printList();
      } else if (tokens[i] == '(') {
        operator_stack.push('(');
      } else if (tokens[i] == ')') {
        while (operator_stack.isNotEmpty && operator_stack.last != '(') {
          outputStack.push(operator_stack.pop());
        }
        operator_stack.pop();
      } else if (isOperator(tokens[i])) {
        while (operator_stack.isNotEmpty && isOperator(operator_stack.last)) {}
      }
    }
    outputStack.printList();
    operator_stack.printList();
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
