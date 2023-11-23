import 'package:flutter/material.dart';

import '../data/global.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1Body();
  }
}

class Page1Body extends StatelessWidget {
  const Page1Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 300,
        color: Colors.blue,
        child: Center(
            child: Text(
          " WELCOME TO SOI 8  ${USERDATA.NAME}",
        )),
      ),
    );
  }
}
