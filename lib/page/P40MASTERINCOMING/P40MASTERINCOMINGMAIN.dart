import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/40-01-P40MASTERINCOMING.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/P40MASTERINCOMINGTABLE.dart';
import 'P40MASTERINCOMINGVAR.dart';

class P40MASTERINCOMINGMAIN extends StatefulWidget {
  P40MASTERINCOMINGMAIN({
    super.key,
    this.data,
  });

  List<P40MASTERINCOMINGclass>? data;

  @override
  State<P40MASTERINCOMINGMAIN> createState() => _P40MASTERINCOMINGMAINState();
}

class _P40MASTERINCOMINGMAINState extends State<P40MASTERINCOMINGMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P40MASTERINCOMING__Bloc>().add(P40MASTERINCOMING_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P40MASTERINCOMINGclass> _data = widget.data ?? [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 46, right: 40, left: 40),
        child: Column(
          children: [
            P40MASTERINCOMINGTABLE(),
            for (int i = 0; i < _data.length; i++) ...[
              P40MASTERINCOMINGTABLEitem(
                text01: _data[i].ITEMS,
                setupreturn: (v) {
                  _TEMPpop(context);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void _TEMPpop(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: _TempSelectWALLet(),
      );
    },
  );
}

class _TempSelectWALLet extends StatefulWidget {
  const _TempSelectWALLet({super.key});

  @override
  State<_TempSelectWALLet> createState() => _TempSelectWALLetState();
}

class _TempSelectWALLetState extends State<_TempSelectWALLet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 280,
        width: 300,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 26,
            ),
            SizedBox(
              height: 100,
              width: 250,
              child: ComInputText(
                sLabel: "ITEMSname",
                height: 70,
                width: 250,
                isNumberOnly: true,
                isContr: P40MASTERINCOMINGVAR.iscontrol,
                fnContr: (input) {
                  P40MASTERINCOMINGVAR.iscontrol = input;
                },
                sValue: P40MASTERINCOMINGVAR.ITEMSET,
                returnfunc: (String s) {
                  P40MASTERINCOMINGVAR.ITEMSET = s;
                },
              ),
            ),
            InkWell(
              onTap: () {
                //
              },
              child: Container(
                height: 50,
                width: 250,
                color: Colors.blue,
                child: Center(
                  child: Text("SAVE"),
                ),
              ),
            )
          ],
        ));
  }
}
