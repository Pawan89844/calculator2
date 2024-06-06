import 'package:calculator/module/home/data/model/buttons_model.dart';

abstract interface class ShuntingYard {
  bool isOperator(String token);
  double evaluate(String expression);
}

class Algorithm implements ShuntingYard {
  int _precedence(String operatorStack) {
    var precedence = Exp.arthExp
        .firstWhere((element) => element.arithmaticExp == operatorStack);
    return precedence.precedence;
  }

  String _spaceAroundOperators(String expression) {
    final operators = RegExp(r'([+x÷()-])');
    return expression.replaceAllMapped(operators, (match) => ' ${match[0]} ');
  }

  double _calculate(double a, double b, String op) {
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

  @override
  bool isOperator(String token) {
    return Exp.arthExp.any((op) => op.arithmaticExp == token);
  }

  @override
  double evaluate(String expression) {
    String expressionWithSpace = _spaceAroundOperators(expression);
    final outputStack = [];
    final inputStack = [];
    final tokens = expressionWithSpace.split(' ');
    final stack = [];
    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        outputStack.add(double.parse(token));
      } else if (token == '(') {
        inputStack.add(token);
      } else if (token == ')') {
        while (inputStack.isNotEmpty && inputStack.last != '(') {
          outputStack.add(inputStack.removeLast());
        }
        inputStack.removeLast();
      } else if (isOperator(token)) {
        while (inputStack.isNotEmpty &&
            isOperator(inputStack.last) &&
            _precedence(inputStack.last) >= _precedence(token)) {
          outputStack.add(inputStack.removeLast());
        }
        inputStack.add(token);
      }
    }
    while (inputStack.isNotEmpty) {
      outputStack.add(inputStack.removeLast());
    }
    for (final element in outputStack) {
      if (element is double) {
        stack.add(element);
      } else {
        final b = stack.removeLast();
        final a = stack.removeLast();

        stack.add(_calculate(a, b, element as String));
      }
    }
    if (stack.length != 1) {
      throw Exception('Invalid expression');
    }
    return stack.first;
  }
}
