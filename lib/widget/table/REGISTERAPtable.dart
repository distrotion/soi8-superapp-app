import 'package:flutter/material.dart';

import 'tablebox.dart';

class REGISTERAPtable extends StatelessWidget {
  const REGISTERAPtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "DATE",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "POID",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "USER ID",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PLANT",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "NAME",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "COMMENT",
            Colorss: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ACTION",
            Colorss: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class REGISTERAPitem extends StatelessWidget {
  REGISTERAPitem({
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
    this.RETURNFN,
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
  Function(String)? RETURNFN;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
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
          flex: 2,
          child: rowbox_type0(
            Head: text06,
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (RETURNFN != null) {
                RETURNFN!(text02!);
              }
            },
            child: rowbox_type2(),
          ),

          // rowbox_type0(
          //   Head: text06,
          // ),
        ),
      ],
    );
  }
}
