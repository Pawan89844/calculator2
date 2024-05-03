import 'package:calculator/module/home/view/calculator_pad.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
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
          const CalculatorPad()
        ],
      ),
    );
  }
}
