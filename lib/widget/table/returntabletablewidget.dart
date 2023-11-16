import 'package:flutter/material.dart';

import 'tablebox.dart';

class RETURNTABLE extends StatelessWidget {
  const RETURNTABLE({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "ITEM ID",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "ITEM NAME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "LOT NO",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "LOCATION",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "STORE DATE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "SORT TIME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "STOCKS",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "CLASS",
          ),
        ),
      ],
    );
  }
}

class TABLECOLUNMNRETURN extends StatelessWidget {
  TABLECOLUNMNRETURN({
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
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text07,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text08,
          ),
        ),
      ],
    );
  }
}
