import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Halaman Pencarian',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Padding(padding: new EdgeInsets.only(top: 20.0)),
        Text(
          '(Comming Soon)',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
