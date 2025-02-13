import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tpk_login_v2/widget/common/ComInputText.dart';

import '../../widget/table/getitemtablewidget.dart';
import '../../widget/table/mastertablewidget.dart';
import 'P102-05-layout.dart';
import 'Zone00VAR.dart';

class GET_ITEM extends StatefulWidget {
  const GET_ITEM({super.key});

  @override
  State<GET_ITEM> createState() => _GET_ITEMState();
}

class _GET_ITEMState extends State<GET_ITEM> {
  @override
  Widget build(BuildContext context) {
    double resp = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: SizedBox(
      height: 1000,
      width: resp > 800 ? 780 : 430,
      child: Column(
        children: [
          ComInputText(
            sPlaceholder: "BARCODE",
            height: 40,
            width: 400,
            isContr: ZONE00GETITEMVAR.iscontrol,
            fnContr: (input) {
              ZONE00GETITEMVAR.iscontrol = input;
            },
            sValue: ZONE00GETITEMVAR.BARCODEGETITEM,
            returnfunc: (String s) {
              ZONE00GETITEMVAR.BARCODEGETITEM = s;
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
          const SizedBox(
            height: 20,
          ),
          laooutRM2(),
        ],
      ),
    ));
  }
}
