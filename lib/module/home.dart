import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int j = -1;
  Container _onFirstRow(int i) {
    List<String> operator = ['AC', '%', '()'];
    return Container(
        alignment: Alignment.center,
        child: TextButton(onPressed: () {}, child: Text(operator[i])));
  }

  Container _onLastColumn(int i) {
    List<String> operators = ['÷', 'x', '-', '+', '='];
    return Container(
        alignment: Alignment.center,
        child:
            TextButton(onPressed: () {}, child: Text(operators[i].toString())));
  }

  String _numbers(int i) {
    // List<int> numbers = [];
    // numbers.add(i);
    // numbers = numbers.reversed.toList();
    if (i == 7 || i == 11 || i == 15) {
      return '';
    } else {
      return '${9 - (i - 4) + 3}';
    }
  }

  Container _digits(int i) {
    return Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        child: TextButton(onPressed: () {}, child: Text(_numbers(i))));
  }

  @kDebugMode
  void _incrJ() {
    if (j < 4) {
      j++;
    } else {
      j = -1;
      j++;
    }
  }

  Container _onLastRow(int i) {
    if (i == 17) {
      return Container(
          alignment: Alignment.center,
          child: TextButton(onPressed: () {}, child: const Text('•')));
    } else {
      return Container(
        alignment: Alignment.center,
        child: TextButton(onPressed: () {}, child: const Text('⌫')),
      );
    }
  }

  Container _gridBody(int i) {
    if (i % 4 == 3) {
      _incrJ();
      return _onLastColumn(j);
    } else if (i ~/ 4 == 0) {
      return _onFirstRow(i);
    } else if (i == 17 || i == 18) {
      return _onLastRow(i);
    }
    // else if (i >= 4 || i <= 9) {
    //   return _digits(i);
    // }
    else {
      return _digits(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Divider(color: Colors.black12),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            children: List.generate(20, (i) => _gridBody(i)),
          )
        ],
      ),
    );
  }
}
