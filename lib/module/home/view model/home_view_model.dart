import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  String _userTypedValue = '';
  String _outputValue = '';

  String get userProvidedVal => _userTypedValue;
  String get outputValue => _outputValue;

  set inputValue(String val) {
    _userTypedValue += val;
    notifyListeners();
  }

  void clear() {
    _userTypedValue = '';
    _outputValue = '';
    notifyListeners();
  }

  set outputValue(String val) {
    _outputValue = val.substring(0, val.length-1);
    notifyListeners();
  }

  void removeLast() {
    _userTypedValue = _userTypedValue.substring(0, _userTypedValue.length - 1);
    notifyListeners();
  }

  void overrideOperator(String newOperator) {}
}
