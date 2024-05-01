import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(useMaterial3: true),
      home: const Placeholder(),
    );
  }
}
