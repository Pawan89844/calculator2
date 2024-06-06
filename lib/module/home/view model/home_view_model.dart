import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  ///[_userTypedValue] holds the user input values such as digits expressions.
  String _userTypedValue = '';

  ///[_outputValue] is the result of evaluated expressions.
  String _outputValue = '';

  String get userProvidedVal => _userTypedValue;
  String get outputValue => _outputValue;

  void setState() {
    notifyListeners();
  }

  set inputValue(String val) {
    _userTypedValue += val;
  }

  void clear() {
    _userTypedValue = '';
    _outputValue = '';
  }

  set outputValue(String val) {
    _outputValue = val;
  }

  /// Removes the last value from [_userTypedValue]
  /// In other words, triggers backspace.
  void removeLast() {
    _userTypedValue = _userTypedValue.substring(0, _userTypedValue.length - 1);
  }

  void overrideOperator(String newOperator) {}
}
