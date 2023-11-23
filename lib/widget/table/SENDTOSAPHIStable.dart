import 'package:flutter/material.dart';

import 'tablebox.dart';

class SENDTOSAPHIStable extends StatelessWidget {
  const SENDTOSAPHIStable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "DATE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MAT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PO",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ITEM",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ITEM NO",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ITEM Master",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Value",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "Return msg",
          ),
        ),
      ],
    );
  }
}

class SENDTOSAPHISitem extends StatelessWidget {
  SENDTOSAPHISitem({
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
          flex: 1,
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
          flex: 2,
          child: rowbox_type0(
            Head: text08,
          ),
        ),
      ],
    );
  }
}
