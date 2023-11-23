import 'package:flutter/material.dart';

import 'tablebox.dart';

class BTTANKHIStable extends StatelessWidget {
  const BTTANKHIStable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "DATE",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "BT2",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "BT3",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "BT4",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT6 ORDER",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT7 ORDER",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT8 ORDER",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT13 ORDER",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT15 ORDER",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "RT17 ORDER",
            Colorss: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BTTANKHISitem extends StatelessWidget {
  BTTANKHISitem({
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
    this.text10,
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
  String? text10;

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
          flex: 1,
          child: rowbox_type0(
            Head: text08,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text09,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text10,
          ),
        ),
      ],
    );
  }
}
