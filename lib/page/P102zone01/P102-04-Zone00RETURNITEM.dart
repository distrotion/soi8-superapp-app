import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/returntabletablewidget.dart';
import 'P102-05-layout.dart';
import 'Zone00VAR.dart';

class RETURN_ITEM extends StatefulWidget {
  const RETURN_ITEM({super.key});

  @override
  State<RETURN_ITEM> createState() => _RETURN_ITEMState();
}

class _RETURN_ITEMState extends State<RETURN_ITEM> {
  @override
  Widget build(BuildContext context) {
    double resp = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: SizedBox(
      height: 680,
      width: resp > 800 ? 780 : 430,
      child: Column(
        children: [
          ComInputText(
            sPlaceholder: "BARCODE",
            height: 40,
            width: 400,
            isContr: ZONE00RETURNITEMVAR.iscontrol,
            fnContr: (input) {
              ZONE00RETURNITEMVAR.iscontrol = input;
            },
            sValue: ZONE00RETURNITEMVAR.BARCODERETRUNITEM,
            returnfunc: (String s) {
              ZONE00RETURNITEMVAR.BARCODERETRUNITEM = s;
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
          const SizedBox(
            height: 20,
          ),
          laooutRM2(),
        ],
      ),
    ));
  }
}
