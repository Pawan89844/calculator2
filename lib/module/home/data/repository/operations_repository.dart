import 'package:calculator/module/home/data/model/buttons_model.dart';

abstract class Operations {
  void add(int i, int digitIndex) {}

  void subtract() {}

  void divide() {}

  void multiply() {}

  void calculate() {}
}

class OperationsRepository implements Operations {
  @override
  void add(int i, int digitIndex) {
    if (Exp.arthExp[i].arithmaticExp == '+') {
      Exp.opsNum[digitIndex].opsNumber;
    }
  }

  @override
  void calculate() {
    // TODO: implement calculate
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
