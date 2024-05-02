import 'package:calculator/module/home.dart';
import 'package:calculator/module/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(useMaterial3: true),
      home: ChangeNotifierProvider(
          create: (context) => HomeViewModel(), child: const Home()),
    );
  }
}
