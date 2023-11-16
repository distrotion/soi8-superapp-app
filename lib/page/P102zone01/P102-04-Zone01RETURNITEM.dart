import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/returntabletablewidget.dart';
import 'Zone01VAR.dart';

class RETURN_ITEM extends StatefulWidget {
  const RETURN_ITEM({super.key});

  @override
  State<RETURN_ITEM> createState() => _RETURN_ITEMState();
}

class _RETURN_ITEMState extends State<RETURN_ITEM> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: 680,
      width: 780,
      child: Column(
        children: [
          ComInputText(
            sPlaceholder: "BARCODE",
            height: 40,
            width: 400,
            isContr: Zone01RETURNITEMVAR.iscontrol,
            fnContr: (input) {
              Zone01RETURNITEMVAR.iscontrol = input;
            },
            sValue: Zone01RETURNITEMVAR.BARCODERETRUNITEM,
            returnfunc: (String s) {
              Zone01RETURNITEMVAR.BARCODERETRUNITEM = s;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 150,
                color: Colors.grey,
                child: Center(
                    child: Text(
                  "RETURN ITEM",
                  style: TextStyle(color: Colors.black),
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
