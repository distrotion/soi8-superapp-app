import 'package:flutter/material.dart';

import '../widget/common/Checkbox.dart';
import 'TEST.dart';
import 'page101.dart';
import 'page102.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Page0Body();
    return Page101();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 100,
          width: 200,
          color: Colors.orange,
          child: const Center(
            child: Text("WELCOME TO SOI8"),
          )),
    );
  }
}
