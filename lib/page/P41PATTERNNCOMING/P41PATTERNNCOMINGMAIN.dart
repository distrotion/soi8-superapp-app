import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/41-01-P41PATTERNNCOMING.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/P41PATTERNNCOMINGTABLE.dart';
import '../../widget/table/P41PATTERNNCOMINGTABLEsub.dart';
import 'P41PATTERNNINCOMINGVAR.dart';

class P41PATTERNNCOMINGINCOMINGMAIN extends StatefulWidget {
  P41PATTERNNCOMINGINCOMINGMAIN({
    super.key,
    this.data,
  });
  List<P41PATTERNNCOMINGclass>? data;

  @override
  State<P41PATTERNNCOMINGINCOMINGMAIN> createState() =>
      _P41PATTERNNCOMINGINCOMINGMAINState();
}

class _P41PATTERNNCOMINGINCOMINGMAINState
    extends State<P41PATTERNNCOMINGINCOMINGMAIN> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P41PATTERNNCOMING__Bloc>().add(P41PATTERNNCOMING_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P41PATTERNNCOMINGclass> _data = widget.data ?? [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 46, right: 40, left: 40),
        child: Column(
          children: [
            P41PATTERNNCOMINGTABLE(),
            for (int i = 0; i < _data.length; i++) ...[
              P41PATTERNNCOMINGTABLEitem(
                text01: _data[i].MAT,
                text02: _data[i].NAME,
                text03: _data[i].CODE,
                setupreturn: (v) {
                  P41PATTERNNINCOMINGVAR.MAT = _data[i].MAT;
                  P41PATTERNNINCOMINGVAR.NAME = _data[i].NAME;
                  P41PATTERNNINCOMINGVAR.CODE = _data[i].CODE;
                  P41PATTERNNINCOMINGVAR.popupdata = _data[i].INCCHECKLIST;

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
        height: 400,
        width: 800,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 400,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 26,
                      ),
                      SizedBox(
                        height: 100,
                        width: 250,
                        child: ComInputText(
                          sLabel: "MAT",
                          height: 70,
                          width: 250,
                          isNumberOnly: true,
                          isContr: P41PATTERNNINCOMINGVAR.iscontrol,
                          fnContr: (input) {
                            P41PATTERNNINCOMINGVAR.iscontrol = input;
                          },
                          sValue: P41PATTERNNINCOMINGVAR.MAT,
                          returnfunc: (String s) {
                            P41PATTERNNINCOMINGVAR.MAT = s;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 250,
                        child: ComInputText(
                          sLabel: "NAME",
                          height: 70,
                          width: 250,
                          isNumberOnly: true,
                          isContr: P41PATTERNNINCOMINGVAR.iscontrol,
                          fnContr: (input) {
                            P41PATTERNNINCOMINGVAR.iscontrol = input;
                          },
                          sValue: P41PATTERNNINCOMINGVAR.NAME,
                          returnfunc: (String s) {
                            P41PATTERNNINCOMINGVAR.NAME = s;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 250,
                        child: AdvanceDropDown(
                          sLabel: "CODE",
                          imgpath: '',
                          listdropdown: const [
                            // MapEntry("", ""),
                            // MapEntry("101", "101"),
                            MapEntry("103", "103"),
                          ],
                          onChangeinside: (d, v) {
                            P41PATTERNNINCOMINGVAR.CODE = d;
                          },
                          value: P41PATTERNNINCOMINGVAR.CODE,
                          height: 40,
                          width: 250,
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
                          child: const Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, right: 6),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 30,
                              width: 100,
                              color: Colors.blue,
                              child: Center(
                                child: Text("add"),
                              ),
                            ),
                          ],
                        ),
                        P41PATTERNNCOMINGTABLEsub(),
                        for (int g = 0;
                            g < P41PATTERNNINCOMINGVAR.popupdata.length;
                            g++) ...[
                          P41PATTERNNCOMINGTABLEsubitem(
                            text01: P41PATTERNNINCOMINGVAR.popupdata[g].ITEMS,
                            text02: P41PATTERNNINCOMINGVAR.popupdata[g].TYPE,
                            text03: P41PATTERNNINCOMINGVAR.popupdata[g].EQ,
                            text04: P41PATTERNNINCOMINGVAR.popupdata[g].MAX,
                            text05: P41PATTERNNINCOMINGVAR.popupdata[g].MIN,
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
