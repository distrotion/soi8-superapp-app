import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tpk_login_v2/widget/common/Error_NO_Popup.dart';

import '../../bloc/BlocEvent/60-02-P60SETRAWMAT.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/base64pic.dart';
import '../../data/global.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Safty.dart';
import '../../widget/table/P60SETRAWMATADD.dart';
import 'P60PRCESSMANUALVAR.dart';

late BuildContext P60PRCESSMANUALMAINcontext;

class P60PRCESSMANUALMAIN extends StatefulWidget {
  const P60PRCESSMANUALMAIN({super.key});

  @override
  State<P60PRCESSMANUALMAIN> createState() => _P60PRCESSMANUALMAINState();
}

class _P60PRCESSMANUALMAINState extends State<P60PRCESSMANUALMAIN> {
  @override
  Widget build(BuildContext context) {
    P60PRCESSMANUALMAINcontext = context;
    return Center(
      child: Container(
        height: 600,
        width: 900,
        // color: Colors.red,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    width: 200,
                    child: ComInputText(
                      isNumberOnly: true,
                      sLabel: "ORDER",
                      height: 40,
                      width: 200,
                      isContr: P60PRCESSMANUALVAR.iscontrol,
                      fnContr: (input) {
                        setState(() {
                          P60PRCESSMANUALVAR.iscontrol = input;
                        });
                      },
                      sValue: P60PRCESSMANUALVAR.ORDER,
                      returnfunc: (String s) {
                        P60PRCESSMANUALVAR.ORDER = s;

                        setState(() {});
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text("SELECT"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              // color: Colors.red,
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 120,
                        //       child: Column(
                        //         children: [
                        //           SizedBox(
                        //             height: 12,
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("PO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("Product NO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("CHEMICAL:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("PLANT:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("TANK:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("LOT. NO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("QTY:"),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 200,
                        //       child: Column(
                        //         children: [
                        //           SizedBox(
                        //             height: 12,
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               SizedBox(
                        //                 width: 200,
                        //                 child: Text(
                        //                   "",
                        //                   overflow: TextOverflow.fade,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                //
                                if (P60PRCESSMANUALVAR.ORDER.length > 8) {
                                  P60PRCESSMANUALVAR.MAT =
                                      P60PRCESSMANUALVAR.ORDER.substring(0, 8);
                                  _POPUPCREATEUSERSW(context);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("BOMB"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                //
                                ADDLOT(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("ADD"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () async {
                                //
                                // context
                                //     .read<SETRAWMATMAIN__Bloc>()
                                //     .add(SETRAWMATMAIN_SET());
                                List<Map<String, String>> datauotsave = [];

                                for (var i = 0;
                                    i < P60PRCESSMANUALVAR.LISTSAVE.length;
                                    i++) {
                                  datauotsave.add({
                                    "NumOrder": P60PRCESSMANUALVAR.ORDER
                                        .substring(12, 18),
                                    "StrChemical":
                                        P60PRCESSMANUALVAR.LISTSAVE[i].Chm,
                                    "StrLotNum":
                                        P60PRCESSMANUALVAR.LISTSAVE[i].LOT,
                                    "StrBarcode": "",
                                    "NumStep": "${i + 1}",
                                    "NumSp": ConverstStr(
                                        P60PRCESSMANUALVAR.LISTSAVE[i].PW),
                                    "NumAct": ConverstStr(
                                        P60PRCESSMANUALVAR.LISTSAVE[i].W),
                                  });
                                }
                                //

                                if (datauotsave.isNotEmpty) {
                                  datauotsave.add({
                                    "NumOrder": P60PRCESSMANUALVAR.ORDER
                                        .substring(12, 18),
                                    "StrChemical": "END",
                                    "StrLotNum": "RTM",
                                    "StrBarcode": "END",
                                    "NumStep": "${datauotsave.length + 1}",
                                    "NumSp": "0",
                                    "NumAct": "0",
                                  });
                                }

                                Dio().post(
                                  serverGB + 'MANUALPROCESS/SAVEdata',
                                  data: {"DATA": datauotsave},
                                ).then((v) {
                                  //
                                  P60PRCESSMANUALVAR.LISTSAVE = [];
                                  showGoodPopup(context, v.data.toString());
                                  setState(() {});
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("SAVE"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                //
                                P60PRCESSMANUALVAR.NumPackSize1 = '';
                                P60PRCESSMANUALVAR.NumPackSize2 = '';
                                P60PRCESSMANUALVAR.NumPackSize3 = '';
                                P60PRCESSMANUALVAR.NumQuantity1 = '';
                                P60PRCESSMANUALVAR.NumQuantity2 = '';
                                P60PRCESSMANUALVAR.NumQuantity3 = '';
                                P60PRCESSMANUALVAR.NumWeight = '';
                                _POPUPPACK(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("SEND TO PACK"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 650,
                    height: 400,
                    // color: Colors.amber,
                    child: SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 2, bottom: 2),
                        child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  P60SETRAWMATADD(),
                                  for (int i = 0;
                                      i < P60PRCESSMANUALVAR.LISTSAVE.length;
                                      i++) ...[
                                    P60SETRAWMATADDitem(
                                      text01: '${i + 1}',
                                      text02: P60PRCESSMANUALVAR.LISTSAVE[i].Bc,
                                      text03:
                                          P60PRCESSMANUALVAR.LISTSAVE[i].Chm,
                                      text04: P60PRCESSMANUALVAR.LISTSAVE[i].W,
                                      text05:
                                          P60PRCESSMANUALVAR.LISTSAVE[i].LOT,
                                      text06:
                                          P60PRCESSMANUALVAR.LISTSAVE[i].SubW,
                                      text07:
                                          P60PRCESSMANUALVAR.LISTSAVE[i].SubLOT,
                                      text08: P60PRCESSMANUALVAR.LISTSAVE[i].PW,
                                      setupreturn1: (v) {
                                        P60PRCESSMANUALVAR.iNO = i;
                                        P60PRCESSMANUALVAR.iNOWHERE = 'W';
                                        INPUTTEXT(context);
                                      },
                                      setupreturn2: (v) {
                                        P60PRCESSMANUALVAR.iNO = i;
                                        P60PRCESSMANUALVAR.iNOWHERE = 'LOT';
                                        INPUTTEXT(context);
                                      },
                                      setupreturn3: (v) {
                                        P60PRCESSMANUALVAR.iNO = i;
                                        P60PRCESSMANUALVAR.iNOWHERE = 'SubW';
                                        INPUTTEXT(context);
                                      },
                                      setupreturn4: (v) {
                                        P60PRCESSMANUALVAR.iNO = i;
                                        P60PRCESSMANUALVAR.iNOWHERE = 'SubLOT';
                                        INPUTTEXT(context);
                                      },
                                      setupreturn5: (v) {
                                        P60PRCESSMANUALVAR.LISTSAVE.removeAt(i);
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PicShowFront extends StatefulWidget {
  PicShowFront({Key? key, required this.base64}) : super(key: key);
  String base64;
  @override
  State createState() => new PicShowFrontState();
}

class PicShowFrontState extends State<PicShowFront> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64);
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}

void _POPUPCREATEUSERSW(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 600,
              width: 800,
              child: Dialog(child: _BlocTableBody()),
            ),
          ),
        ),
      );
    },
  );
}

class _BlocTableBody extends StatelessWidget {
  const _BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SETRAWMATMAIN__Bloc(),
        child: BlocBuilder<SETRAWMATMAIN__Bloc, List<SETRAWMATMAINclass>>(
          builder: (context, data) {
            return SETRAWMATMAIN(
              data: data,
            );
          },
        ));
  }
}

class SETRAWMATMAIN extends StatefulWidget {
  SETRAWMATMAIN({
    super.key,
    this.data,
  });
  List<SETRAWMATMAINclass>? data;

  @override
  State<SETRAWMATMAIN> createState() => _SETRAWMATMAINState();
}

class _SETRAWMATMAINState extends State<SETRAWMATMAIN> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SETRAWMATMAIN__Bloc>().add(SETRAWMATMAIN_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<SETRAWMATMAINclass> _data = widget.data ?? [];

    return Container(
      height: 400,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 46, right: 40, left: 40),
          child: Column(
            children: [
              Text("Raw mat Prepareation"),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("ORDER : "),
                  // Text(P43SETRAWMATVAR.MAT),
                  // Text(P43SETRAWMATVAR.ORDER),
                  SizedBox(
                    width: 16,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      //
                      P60PRCESSMANUALVAR.LISTSAVE = _data;
                      P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                          .rebuildPage();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text("COMFIRM"),
                      ),
                    ),
                  ),
                  // Text(P43SETRAWMATVAR.NAME),
                ],
              ),
              P60SETRAWMATADD(),
              for (int i = 0; i < _data.length; i++) ...[
                P60SETRAWMATADDitem(
                  text01: '${i + 1}',
                  text02: _data[i].Bc,
                  text03: _data[i].Chm,
                  text04: _data[i].W,
                  text05: _data[i].LOT,
                  text08: _data[i].PW,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

void INPUTTEXT(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Dialog(child: INPUTTEXTDATAPOP()),
        ),
      );
    },
  );
}

class INPUTTEXTDATAPOP extends StatefulWidget {
  const INPUTTEXTDATAPOP({super.key});

  @override
  State<INPUTTEXTDATAPOP> createState() => _INPUTTEXTDATAPOPState();
}

class _INPUTTEXTDATAPOPState extends State<INPUTTEXTDATAPOP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: 200,
                child: ComInputText(
                  // isNumberOnly: true,
                  sLabel: "INPUDATA",
                  height: 40,
                  width: 200,
                  isContr: P60PRCESSMANUALVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P60PRCESSMANUALVAR.iscontrol = input;
                    });
                  },
                  sValue: P60PRCESSMANUALVAR.DATAIN,
                  returnfunc: (String s) {
                    P60PRCESSMANUALVAR.DATAIN = s;

                    setState(() {});
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //i
                  if (P60PRCESSMANUALVAR.iNOWHERE == 'W') {
                    P60PRCESSMANUALVAR.LISTSAVE[P60PRCESSMANUALVAR.iNO].W =
                        P60PRCESSMANUALVAR.DATAIN;

                    P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                        .rebuildPage();
                    Navigator.pop(context);
                  } else if (P60PRCESSMANUALVAR.iNOWHERE == 'LOT') {
                    P60PRCESSMANUALVAR.LISTSAVE[P60PRCESSMANUALVAR.iNO].LOT =
                        P60PRCESSMANUALVAR.DATAIN;

                    P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                        .rebuildPage();
                    Navigator.pop(context);
                  } else if (P60PRCESSMANUALVAR.iNOWHERE == 'SubW') {
                    P60PRCESSMANUALVAR.LISTSAVE[P60PRCESSMANUALVAR.iNO].SubW =
                        P60PRCESSMANUALVAR.DATAIN;

                    P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                        .rebuildPage();
                    Navigator.pop(context);
                  } else if (P60PRCESSMANUALVAR.iNOWHERE == 'SubLOT') {
                    P60PRCESSMANUALVAR.LISTSAVE[P60PRCESSMANUALVAR.iNO].SubLOT =
                        P60PRCESSMANUALVAR.DATAIN;

                    P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                        .rebuildPage();
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("SAVE"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void ADDLOT(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SizedBox(
          height: 400,
          width: 600,
          child: Dialog(child: ADDLOTDATASET()),
        ),
      );
    },
  );
}

class ADDLOTDATASET extends StatefulWidget {
  const ADDLOTDATASET({super.key});

  @override
  State<ADDLOTDATASET> createState() => _ADDLOTDATASETState();
}

class _ADDLOTDATASETState extends State<ADDLOTDATASET> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: 200,
                child: ComInputText(
                  // isNumberOnly: true,
                  sLabel: "MAT NO",
                  height: 40,
                  width: 200,
                  isContr: P60PRCESSMANUALVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P60PRCESSMANUALVAR.iscontrol = input;
                    });
                  },
                  sValue: P60PRCESSMANUALVAR.MATNOSET,
                  returnfunc: (String s) {
                    P60PRCESSMANUALVAR.MATNOSET = s;

                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 80,
                width: 200,
                child: ComInputText(
                  // isNumberOnly: true,
                  sLabel: "CHEM",
                  height: 40,
                  width: 200,
                  isContr: P60PRCESSMANUALVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P60PRCESSMANUALVAR.iscontrol = input;
                    });
                  },
                  sValue: P60PRCESSMANUALVAR.CHEMSET,
                  returnfunc: (String s) {
                    P60PRCESSMANUALVAR.CHEMSET = s;

                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 80,
                width: 200,
                child: ComInputText(
                  // isNumberOnly: true,
                  sLabel: "Weight",
                  height: 40,
                  width: 200,
                  isContr: P60PRCESSMANUALVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P60PRCESSMANUALVAR.iscontrol = input;
                    });
                  },
                  sValue: P60PRCESSMANUALVAR.WeightSET,
                  returnfunc: (String s) {
                    P60PRCESSMANUALVAR.WeightSET = s;

                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 80,
                width: 200,
                child: ComInputText(
                  // isNumberOnly: true,
                  sLabel: "LOT",
                  height: 40,
                  width: 200,
                  isContr: P60PRCESSMANUALVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P60PRCESSMANUALVAR.iscontrol = input;
                    });
                  },
                  sValue: P60PRCESSMANUALVAR.LOTNOSET,
                  returnfunc: (String s) {
                    P60PRCESSMANUALVAR.LOTNOSET = s;

                    setState(() {});
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  P60PRCESSMANUALVAR.LISTSAVE.add(SETRAWMATMAINclass(
                    Bc: P60PRCESSMANUALVAR.MATNOSET,
                    // Fml: P60PRCESSMANUALVAR.LOTNOSET,
                    Chm: P60PRCESSMANUALVAR.CHEMSET,
                    W: P60PRCESSMANUALVAR.WeightSET,
                    LOT: P60PRCESSMANUALVAR.LOTNOSET,
                  ));
                  P60PRCESSMANUALMAINcontext.read<BlocPageRebuild>()
                      .rebuildPage();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("ADD"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _POPUPPACK(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: 400,
              width: 700,
              child: Dialog(child: POPUPPACKF()),
            ),
          ),
        ),
      );
    },
  );
}

class POPUPPACKF extends StatefulWidget {
  const POPUPPACKF({super.key});

  @override
  State<POPUPPACKF> createState() => _POPUPPACKFState();
}

class _POPUPPACKFState extends State<POPUPPACKF> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet Size 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumPackSize1,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumPackSize1 = s;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet QTY 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumQuantity1,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumQuantity1 = s;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet Size 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumPackSize2,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumPackSize2 = s;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet QTY 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumQuantity2,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumQuantity2 = s;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet Size 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumPackSize3,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumPackSize3 = s;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ComInputText(
                        sLabel: "Packet QTY 01",
                        height: 40,
                        width: 250,
                        isContr: P60PRCESSMANUALVAR.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            P60PRCESSMANUALVAR.iscontrol = input;
                          });
                        },
                        sPlaceholder: "",
                        sValue: P60PRCESSMANUALVAR.NumQuantity3,
                        returnfunc: (String s) {
                          setState(() {
                            P60PRCESSMANUALVAR.NumQuantity3 = s;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ComInputText(
                    sLabel: "Remain",
                    height: 40,
                    width: 250,
                    isContr: P60PRCESSMANUALVAR.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        P60PRCESSMANUALVAR.iscontrol = input;
                      });
                    },
                    sPlaceholder: "",
                    sValue: P60PRCESSMANUALVAR.NumWeight,
                    returnfunc: (String s) {
                      setState(() {
                        P60PRCESSMANUALVAR.NumWeight = s;
                      });
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Dio().post(
                    server2 + 'datacentertest/PackNoSCADA',
                    data: {
                      "NumOrder": P60PRCESSMANUALVAR.ORDER.substring(12, 18),
                      "NumPackSize1": P60PRCESSMANUALVAR.NumPackSize1,
                      "NumPackSize2": P60PRCESSMANUALVAR.NumPackSize2,
                      "NumPackSize3": P60PRCESSMANUALVAR.NumPackSize3,
                      //
                      "NumQuantity1": P60PRCESSMANUALVAR.NumQuantity1,
                      "NumQuantity2": P60PRCESSMANUALVAR.NumQuantity2,
                      "NumQuantity3": P60PRCESSMANUALVAR.NumQuantity3,
                      "NumWeight": P60PRCESSMANUALVAR.NumWeight,
                      //
                    },
                  ).then((v) {
                    //

                    setState(() {});
                    if (v.data['msg'] != null) {
                      showGoodPopup(
                          P60PRCESSMANUALMAINcontext, v.data['msg'].toString());
                      Navigator.pop(context);
                    } else {
                      showErrorPopup(
                          P60PRCESSMANUALMAINcontext, v.data['msg'].toString());
                    }
                  });
                },
                child: Container(
                  height: 60,
                  width: 500,
                  color: Colors.blue,
                  child: Center(
                    child: Text("ADD"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
