import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tpk_login_v2/widget/common/ComInputText.dart';

import '../../widget/table/getitemtablewidget.dart';
import '../../widget/table/mastertablewidget.dart';
import 'Zone01VAR.dart';

class GET_ITEM extends StatefulWidget {
  const GET_ITEM({super.key});

  @override
  State<GET_ITEM> createState() => _GET_ITEMState();
}

class _GET_ITEMState extends State<GET_ITEM> {
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
            isContr: Zone01GETITEMVAR.iscontrol,
            fnContr: (input) {
              Zone01GETITEMVAR.iscontrol = input;
            },
            sValue: Zone01GETITEMVAR.BARCODEGETITEM,
            returnfunc: (String s) {
              Zone01GETITEMVAR.BARCODEGETITEM = s;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 150,
                color: Colors.black,
                child: Center(
                    child: Text(
                  "GET ITEM",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
