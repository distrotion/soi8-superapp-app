import 'package:flutter/material.dart';

import 'tablebox.dart';

class MASTERTABLE extends StatelessWidget {
  const MASTERTABLE({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "CREATE DATE",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "MAT ID",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MAT NAME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "USER",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "USER UPDATE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ACTION",
          ),
        ),
      ],
    );
  }
}

class TABLECOLUNMNMASTER extends StatelessWidget {
  TABLECOLUNMNMASTER({
    super.key,
    this.text01,
    this.text02,
    this.text03,
    this.text04,
    this.text05,
    this.text06,
    this.text07,
    this.text08,
  });

  String? text01;
  String? text02;
  String? text03;
  String? text04;
  String? text05;
  String? text06;
  String? text07;
  String? text08;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: text01,
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: text02,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text03,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text04,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text05,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text06,
          ),
        ),
      ],
    );
  }
}
