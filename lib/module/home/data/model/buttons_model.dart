// class ButtonsModel {
//   final List<ArithmaticExpressions> arthExp;
//   final List<OperationalNumbers> operationalNumbers;
//   final List<SpecialExpressions> specialExpressions;

//   ButtonsModel(
//       {required this.arthExp,
//       required this.operationalNumbers,
//       required this.specialExpressions});

//   factory ButtonsModel.expressions() {
//     return ButtonsModel(
//         arthExp: Exp.arthExp,
//         operationalNumbers: Exp.opsNum,
//         specialExpressions: Exp.specialExp);
//   }
// }

class ArithmaticExpressions {
  final int id;
  final String arithmaticExp;

  ArithmaticExpressions({required this.id, required this.arithmaticExp});
}

class OperationalNumbers {
  final int id;
  final int opsNumber;

  OperationalNumbers({required this.id, required this.opsNumber});
}

class SpecialExpressions {
  final int id;
  final String specialExp;

  SpecialExpressions({required this.id, required this.specialExp});
}

class Exp {
  static List<ArithmaticExpressions> arthExp = <ArithmaticExpressions>[
    ArithmaticExpressions(id: 0, arithmaticExp: '÷'),
    ArithmaticExpressions(id: 1, arithmaticExp: 'x'),
    ArithmaticExpressions(id: 2, arithmaticExp: '-'),
    ArithmaticExpressions(id: 3, arithmaticExp: '+'),
    ArithmaticExpressions(id: 4, arithmaticExp: '='),
  ];
  static List<OperationalNumbers> opsNum = [
    OperationalNumbers(id: 0, opsNumber: 7),
    OperationalNumbers(id: 1, opsNumber: 8),
    OperationalNumbers(id: 2, opsNumber: 9),
    OperationalNumbers(id: 3, opsNumber: 4),
    OperationalNumbers(id: 4, opsNumber: 5),
    OperationalNumbers(id: 5, opsNumber: 6),
    OperationalNumbers(id: 6, opsNumber: 1),
    OperationalNumbers(id: 7, opsNumber: 2),
    OperationalNumbers(id: 8, opsNumber: 3),
    OperationalNumbers(id: 9, opsNumber: 0),
  ];
  static List<SpecialExpressions> specialExp = [
    SpecialExpressions(id: 0, specialExp: 'AC'),
    SpecialExpressions(id: 1, specialExp: '%'),
    SpecialExpressions(id: 2, specialExp: '()'),
  ];
}
