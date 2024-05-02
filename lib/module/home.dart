import 'package:calculator/module/home_helper.dart';
import 'package:calculator/module/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          const MyGrid()
        ],
      ),
    );
  }
}

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> with HomeHelper {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      addAutomaticKeepAlives: true,
      primary: false,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: 20,
      itemBuilder: (context, i) {
        var provider = Provider.of<HomeViewModel>(context, listen: false);
        if (i % 4 == 3) {
          incrJ();
          return onLastColumn(j, context);
        } else if (i ~/ 4 == 0) {
          return onFirstRow(i, context);
        } else if (i == 17 || i == 18) {
          if (i == 17) {
            return Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      if (provider.userProvidedVal.isNotEmpty &&
                          !provider.userProvidedVal.contains('.')) {
                        provider.inputValue = '.';
                      }
                    },
                    child: const Text('•')));
          } else {
            return Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    if (provider.userProvidedVal.isNotEmpty) {
                      provider.replaceOperator();
                    }
                  },
                  child: const Text('⌫')),
            );
          }
        } else {
          incrK();
          return Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    provider.inputValue = numbers[digitIndex(i)].toString();
                  },
                  child: Text(numbers[k].toString())));
        }
      },
    );
  }
}
