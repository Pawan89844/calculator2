import 'package:calculator/module/home/data/grid_helper.dart';
import 'package:calculator/module/home/view%20model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPad extends StatefulWidget {
  const CalculatorPad({super.key});

  @override
  State<CalculatorPad> createState() => _CalculatorPadState();
}

class _CalculatorPadState extends State<CalculatorPad> with GridHelper {
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
          repository.incrementJ();
          return onLastColumn(repository.j, provider);
        } else if (i ~/ 4 == 0) {
          return onFirstRow(i, provider);
        } else if (i == 17 || i == 18) {
          return onSpecialCell(i, provider);
        } else {
          repository.incrementK();
          return onElseCase(i, provider);
        }
      },
    );
  }
}
