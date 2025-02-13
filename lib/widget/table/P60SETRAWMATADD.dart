import 'package:flutter/material.dart';

import 'tablebox.dart';

class P60SETRAWMATADD extends StatelessWidget {
  P60SETRAWMATADD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "NO",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "MAT",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "Chm",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "W SV",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Weight",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "Lot",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Sub weight",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "Sub LOT ",
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

class P60SETRAWMATADDitem extends StatelessWidget {
  P60SETRAWMATADDitem({
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
    this.setupreturn1,
    this.setupreturn2,
    this.setupreturn3,
    this.setupreturn4,
    this.setupreturn5,
    this.HOLDver,
    this.HOLDvers,
    this.isdelete,
    this.deleteFN,
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
  Function(String)? setupreturn1;
  Function(String)? setupreturn2;
  Function(String)? setupreturn3;
  Function(String)? setupreturn4;
  Function(String)? setupreturn5;
  Function(bool)? HOLDver;
  bool? HOLDvers;

  bool? isdelete;
  Function(String)? deleteFN;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
              Head: text01,
              Colorss:
                  (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
              Head: text02,
              Colorss:
                  (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
              Head: text03,
              Colorss:
                  (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
              Head: text08,
              Colorss:
                  (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (setupreturn1 != null) {
                setupreturn1!('');
              }
            },
            child: rowbox_type0(
                Head: text04,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              if (setupreturn2 != null) {
                setupreturn2!('');
              }
            },
            child: rowbox_type0(
                Head: text05,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (setupreturn3 != null) {
                setupreturn3!('');
              }
            },
            child: rowbox_type0(
                Head: text06,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              if (setupreturn4 != null) {
                setupreturn4!('');
              }
            },
            child: rowbox_type0(
                Head: text07,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (setupreturn5 != null) {
                setupreturn5!('');
              }
            },
            child: rowbox_type2(
              Head: text07,
            ),
          ),
        ),
      ],
    );
  }
}
