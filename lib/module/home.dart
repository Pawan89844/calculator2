import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Container _onFirstRow(i) {
    List<IconData> operator = [
      Icons.clear,
      Icons.mode,
      Icons.remove,
      Icons.dangerous
    ];
    return Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        child: IconButton(onPressed: () {}, icon: Icon(operator[i])));
  }

  Container _gridBody(int i) {
    if (i >= 4) {
      return Container(
          // color: Colors.blue,
          alignment: Alignment.center,
          child: TextButton(onPressed: () {}, child: Text('${i - 4}')));
    } else if (i == 0 || i <= 3) {
      return _onFirstRow(i);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
