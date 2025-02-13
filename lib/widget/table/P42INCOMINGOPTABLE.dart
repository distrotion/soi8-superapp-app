import 'package:flutter/material.dart';

import 'tablebox.dart';

class P42INCOMINGOPTABLE extends StatelessWidget {
  P42INCOMINGOPTABLE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "MAT",
          ),
        ),
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: "Vender",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "LOT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QTY",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "UNIT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PACKET",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "UNITSIZE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QTYPUNIT",
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: rowbox_type0(
        //     Head: "ACTION",
        //   ),
        // ),
      ],
    );
  }
}

class P42INCOMINGOPTABLEitem extends StatelessWidget {
  P42INCOMINGOPTABLEitem({
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
    this.HOLDver,
    this.HOLDvers,
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
  Function(bool)? HOLDver;
  bool? HOLDvers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v) {
        if (HOLDver != null) {
          HOLDver!(v);
        }
      },
      onTap: () {
        if (setupreturn != null) {
          setupreturn!(text01 ?? '');
        }
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: rowbox_type0(
                Head: text01,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),

          Expanded(
            flex: 3,
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
                Head: text04,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
          Expanded(
            flex: 1,
            child: rowbox_type0(
                Head: text05,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
          Expanded(
            flex: 1,
            child: rowbox_type0(
                Head: text06,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
          Expanded(
            flex: 1,
            child: rowbox_type0(
                Head: text06,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
          Expanded(
            flex: 1,
            child: rowbox_type0(
                Head: text07,
                Colorss:
                    (HOLDvers ?? false) ? Colors.green.shade200 : Colors.white),
          ),
          // Expanded(
          //   flex: 1,
          //   child: InkWell(
          //     onTap: () {
          //       if (setupreturn != null) {
          //         setupreturn!(text01 ?? '');
          //       }
          //     },
          //     child: rowbox_type1(
          //       Head: text01,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
