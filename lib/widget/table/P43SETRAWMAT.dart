import 'package:flutter/material.dart';

import 'tablebox.dart';

class P43SETRAWMATTABLE extends StatelessWidget {
  P43SETRAWMATTABLE({
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
          flex: 3,
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
            Head: "W",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "LOT Recomment",
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

class P43SETRAWMATTABLEitem extends StatelessWidget {
  P43SETRAWMATTABLEitem({
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
          flex: 2,
          child: rowbox_type0(
              Head: text05,
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
    );
  }
}
