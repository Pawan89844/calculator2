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

  /// Manual Indexing of Numbers from Grid.
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

  /// The function consist functionalities...
  /// 1. Clear the input through AC.
  /// 2. Calculate Percentage of Provided Value.
  /// 3. Calulate Square.
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

  /// This function has...
  /// 1. Populates typed value to the screen.
  /// 2. Performs calculations onto user input
  @override
  void onClickOfOperators(int i, HomeViewModel provider) {
    String val = provider.userProvidedVal;
    if (val.isNotEmpty) {
      provider.inputValue = Exp.arthExp[i].arithmaticExp;
    }
    calculate(provider);
    // if (provider.userProvidedVal[provider.userProvidedVal.length - 1] ==
    //     Exp.arthExp[i].arithmaticExp) {
    //   print('True: ${Exp.arthExp[i].arithmaticExp}');
    // }
  }

  /// The function adds a dot between values.
  @override
  void onSpecialOperator(int i, HomeViewModel provider) {
    if (provider.userProvidedVal.isNotEmpty &&
        !provider.userProvidedVal.contains('.')) {
      provider.inputValue = '.';
    }
  }

  /// This function removes last value entered by user.
  @override
  void onSpecialOperatorElse(int i, HomeViewModel provider) {
    if (provider.userProvidedVal.isNotEmpty) {
      provider.removeLast();
    }
  }

  /// The function displays numbers onto the CalInput Panel.
  @override
  void onNumbers(int i, HomeViewModel provider) {
    provider.inputValue = Exp.opsNum[digitIndex(i)].opsNumber.toString();
  }
}
