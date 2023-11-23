import 'package:flutter/material.dart';

import '../data/global.dart';
import '../widget/common/Checkbox.dart';
import 'TEST.dart';
import 'page1.dart';
import 'page101.dart';
import 'page102.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Page0Body();
    return Page1();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 100,
          width: 400,
          color: Colors.orange,
          child: Center(
            child: Text("WELCOME TO SOI8"),
          )),
    );
  }
}
