import 'package:flutter/material.dart';
import 'package:qc_ui_isn_hes/page/page10.dart';

import '../data/global.dart';
import '../widget/common/Checkbox.dart';
import 'TEST.dart';
import 'page1.dart';

import 'page101.dart';
import 'page102.dart';
import 'page11.dart';
import 'page31.dart';
import 'page40.dart';
import 'page41.dart';
import 'page42.dart';
import 'page60.dart';
import 'page61.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Page0Body();
    // return Page60();
    return Page10();
  }
}

//--

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Page101();
    return Page42();
  }
}
