import 'package:flutter/material.dart';

import 'tablebox.dart';

class P40MASTERINCOMINGTABLE extends StatelessWidget {
  P40MASTERINCOMINGTABLE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: "ITEMs",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "EDIT",
          ),
        ),
      ],
    );
  }
}

class P40MASTERINCOMINGTABLEitem extends StatelessWidget {
  P40MASTERINCOMINGTABLEitem({
    super.key,
    this.text01,
    this.text02,
    this.text03,
    this.text04,
    this.text05,
    this.text06,
    this.text07,
    this.text08,
    this.text09,
    this.setupreturn,
  });

  String? text01;
  String? text02;
  String? text03;
  String? text04;
  String? text05;
  String? text06;
  String? text07;
  String? text08;
  String? text09;
  Function(String)? setupreturn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: text01,
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (setupreturn != null) {
                setupreturn!(text01 ?? '');
              }
            },
            child: rowbox_type1(
              Head: text01,
            ),
          ),
        ),
      ],
    );
  }
}
