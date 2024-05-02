import 'package:calculator/module/home_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int j = -1;
  int k = -1;

  Widget _onFirstRow(int i) {
    List<String> operator = ['AC', '%', '()'];
    return Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              var provider = Provider.of<HomeViewModel>(context, listen: false);
              if (operator[i] == 'AC') {
                provider.clear();
              }
            },
            child: Text(operator[i])));
  }

  Widget _onLastColumn(int i) {
    List<String> operators = ['÷', 'x', '-', '+', '='];
    return Container(
        alignment: Alignment.center,
        child:
            TextButton(onPressed: () {}, child: Text(operators[i].toString())));
  }

  String _numbers(int i) {
    List<int> numbers = [7, 8, 9, 4, 5, 6, 1, 2, 3, 0];
    _incrK();
    return '${numbers[k]}';
  }

  Widget _digits(int i) {
    return Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              var provider = Provider.of<HomeViewModel>(context, listen: false);
              provider.inputValue = _numbers(i);
            },
            child: Text(_numbers(i))));
  }

  @kDebugMode
  void _incrK() {
    if (k < 9) {
      k++;
    } else {
      k = -1;
      k++;
    }
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

  Widget _onLastRow(int i) {
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

  Widget _gridBody(int i) {
    if (i % 4 == 3) {
      _incrJ();
      return _onLastColumn(j);
    } else if (i ~/ 4 == 0) {
      return _onFirstRow(i);
    } else if (i == 17 || i == 18) {
      return _onLastRow(i);
    } else {
      return _digits(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 10.0),
              child: Consumer<HomeViewModel>(builder: (context, val, _) {
                return Column(
                  children: [
                    Text(
                      val.userProvidedVal,
                      style: const TextStyle(fontSize: 25.0),
                    ),
                    Text(
                      val.outputValue,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                );
              })),
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
