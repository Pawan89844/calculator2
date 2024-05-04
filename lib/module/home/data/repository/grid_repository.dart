import 'package:calculator/module/home/data/repository/operations_repository.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';

import '../model/buttons_model.dart';

abstract class GridRepo {
  void incrementJ() {}

  void incrementK() {}

  void onFirstRowClick(int i, HomeViewModel proivder) {}

  void onClickOfOperators(int i, HomeViewModel provider) {}
  void onSpecialOperator(int i, HomeViewModel provider) {}
  void onSpecialOperatorElse(int i, HomeViewModel provider) {}
  void onNumbers(int i, HomeViewModel provider) {}
}

class GridRepository extends OperationsRepository implements GridRepo {
  int j = -1;
  int k = -1;

  @override
  void incrementJ() {
    if (j < 4) {
      j++;
    } else {
      j = -1;
      j++;
    }
  }

  @override
  void incrementK() {
    if (k < 9) {
      k++;
    } else {
      k = -1;
      k++;
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

  @override
  void onFirstRowClick(int i, HomeViewModel provider) {
    if (Exp.specialExp[i].specialExp == 'AC') {
      provider.clear();
    }
    if (Exp.specialExp[i].specialExp == '%' &&
        provider.userProvidedVal.isNotEmpty) {
      provider.inputValue = Exp.specialExp[i].specialExp;
    }
  }

  @override
  void onClickOfOperators(int i, HomeViewModel provider) {
    String val = provider.userProvidedVal;
    if (val.isEmpty) {
      return;
    } else {
      provider.inputValue = Exp.arthExp[i].arithmaticExp;
    }
    if (provider.userProvidedVal[provider.userProvidedVal.length - 1] ==
        Exp.arthExp[i].arithmaticExp) {
      print('True: ${Exp.arthExp[i].arithmaticExp}');
    }
  }

  @override
  void onSpecialOperator(int i, HomeViewModel provider) {
    if (provider.userProvidedVal.isNotEmpty &&
        !provider.userProvidedVal.contains('.')) {
      provider.inputValue = '.';
    }
  }

  @override
  void onSpecialOperatorElse(int i, HomeViewModel provider) {
    if (provider.userProvidedVal.isNotEmpty) {
      provider.removeLast();
    }
  }

  @override
  void onNumbers(int i, HomeViewModel provider) {
    provider.inputValue = Exp.opsNum[digitIndex(i)].opsNumber.toString();
  }
}
