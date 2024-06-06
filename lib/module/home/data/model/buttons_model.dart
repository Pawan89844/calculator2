class ArithmaticExpressions {
  final int id;
  final int precedence;
  final String arithmaticExp;

  ArithmaticExpressions(
      {required this.id,
      required this.precedence,
      required this.arithmaticExp});
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
    ArithmaticExpressions(id: 0, precedence: 2, arithmaticExp: '÷'),
    ArithmaticExpressions(id: 1, precedence: 2, arithmaticExp: 'x'),
    ArithmaticExpressions(id: 2, precedence: 1, arithmaticExp: '-'),
    ArithmaticExpressions(id: 3, precedence: 1, arithmaticExp: '+'),
    ArithmaticExpressions(id: 4, precedence: 0, arithmaticExp: '='),
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
