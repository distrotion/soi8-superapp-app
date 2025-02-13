import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-01-01-Zone00MASTERTABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import 'Zone00VAR.dart';

late BuildContext MASTER_TABLE_P_context;

class MASTER_TABLE_P extends StatefulWidget {
  const MASTER_TABLE_P({super.key});

  @override
  State<MASTER_TABLE_P> createState() => _MASTER_TABLE_PState();
}

class _MASTER_TABLE_PState extends State<MASTER_TABLE_P> {
  @override
  Widget build(BuildContext context) {
    return _MASTER_TABLE_BLOC();
  }
}

class _MASTER_TABLE_BLOC extends StatelessWidget {
  /// {@macro counter_page}
  const _MASTER_TABLE_BLOC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ZONE00MASTERTABLE_Bloc(),
        child: BlocBuilder<ZONE00MASTERTABLE_Bloc, List<INVAMASTERCLASS>>(
          builder: (context, data) {
            return MASTER_TABLE(data: data);
          },
        ));
  }
}

class MASTER_TABLE extends StatefulWidget {
  MASTER_TABLE({
    super.key,
    this.data,
  });
  List<INVAMASTERCLASS>? data;

  @override
  State<MASTER_TABLE> createState() => _MASTER_TABLEState();
}

class _MASTER_TABLEState extends State<MASTER_TABLE> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ZONE00MASTERTABLE_Bloc>().add(ZONE00MASTERTABLE_GET());
  }

  @override
  Widget build(BuildContext context) {
    MASTER_TABLE_P_context = context;
    List<INVAMASTERCLASS> _data = widget.data ?? [];
    // print(ZONE00MASTERVAR.GROUP);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComInputText(
                sPlaceholder: "search",
                height: 40,
                width: 400,
                isContr: ZONE00MASTERVAR.iscontrol,
                fnContr: (input) {
                  ZONE00MASTERVAR.iscontrol = input;
                },
                sValue: ZONE00MASTERVAR.SEARCH,
                returnfunc: (String s) {
                  ZONE00MASTERVAR.SEARCH = s;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: () {
                  ZONE00MASTERVAR.MODE = 'NEW';
                  _GETDATAMASTERpop(context);
                },
                child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.black,
                  child: Center(
                      child: Text(
                    "NEW MASTER",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 580,
          width: 780,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MASTERTABLE(),
                //----------
                for (int i = 0; i < _data.length; i++) ...[
                  // _data[i],
                  TABLECOLUNMNMASTER(
                    text01: _data[i].date,
                    text02: _data[i].MATID,
                    text03: _data[i].MATNAME,
                    text04: _data[i].USER,
                    text05: _data[i].UPDATEDATE,
                    text06: "",
                    RAWDATA: _data[i],
                    RAWDATARETURN: (v) {
                      ZONE00MASTERVAR.MODE = '';
                      _GETDATAMASTERpop(context);
                    },
                    RAWDATARETURNEDIT: (v, s) {
                      ZONE00MASTERVAR.MODE = 'Edit';
                      _GETDATAMASTERpop(context);
                    },
                  ),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _GETDATAMASTERpop(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return _GETDATAMASTERWIDGET(
        contextin: contextin,
      );
    },
  );
}

class _GETDATAMASTERWIDGET extends StatelessWidget {
  _GETDATAMASTERWIDGET({
    super.key,
    this.contextin,
  });
  BuildContext? contextin;
  bool? iscontrol;
  INVAMASTERCLASS? datainput;
  @override
  Widget build(BuildContext context) {
    return _GETDATAMASTERWIDGETBODY(
      contextin: contextin,
    );
  }
}

class _GETDATAMASTERWIDGETBODY extends StatefulWidget {
  _GETDATAMASTERWIDGETBODY({
    super.key,
    this.contextin,
  });
  BuildContext? contextin;

  @override
  State<_GETDATAMASTERWIDGETBODY> createState() =>
      __GETDATAMASTERWIDGETBODYState();
}

class __GETDATAMASTERWIDGETBODYState extends State<_GETDATAMASTERWIDGETBODY> {
  @override
  Widget build(BuildContext context) {
    double width01 = 150;
    return Dialog(
      child: Container(
        height: 500,
        width: 400,
        color: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 2200,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.red,
                                  child: Center(child: Text("date")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("UID")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("MATID")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("Description")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("GROUP")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("PACKING_TYPE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("BUn")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("PACKET_SIZE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("Safty_Stock")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("AGE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("AGE_TYPE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("MATER_TYPE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("LEAD")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("LEAD_UNIT")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("CLASS")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("MINAGE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("ITEMNAME_F_FULL")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("ITEMNAME_F")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("ITEMNAME_R_CODE")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("ITEMNAME_R_TD")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-1")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-2")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-3")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-4")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-5")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-6")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-7")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-8")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-9")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("FG-10")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-1")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-2")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-3")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-4")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-5")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-6")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-7")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-8")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-9")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-10")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("RM-11")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("CR-1")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("TEST-0")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("Location_Plants")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("Location_Stock")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("User_Create")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("User_Create_TMS")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("User_Edit")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: width01,
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 40,
                                  // color: Colors.blue,
                                  child: Center(child: Text("User_Edit_TMS")),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  ZONE00MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: ZONE00MASTERVAR.date,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.date = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  ZONE00MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: ZONE00MASTERVAR.UID,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.UID = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  ZONE00MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: ZONE00MASTERVAR.MATID,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.MATID = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  ZONE00MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: ZONE00MASTERVAR.Description,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.Description = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.GROUP = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.GROUP,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.PACKING_TYPE = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.PACKING_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.BUn = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.BUn,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.PACKET_SIZE = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.PACKET_SIZE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.Safty_Stock,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.Safty_Stock = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.AGE,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.AGE = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.AGE_TYPE = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.AGE_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.MATER_TYPE = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.MATER_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.LEAD,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.LEAD = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.LEAD_UNIT = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.LEAD_UNIT,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.CLASS = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.CLASS,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.MINAGE,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.MINAGE = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.ITEMNAME_F_FULL,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.ITEMNAME_F_FULL = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.ITEMNAME_F,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.ITEMNAME_F = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.ITEMNAME_R_CODE,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.ITEMNAME_R_CODE = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              //isEnabled: true,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.ITEMNAME_R_TD,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.ITEMNAME_R_TD = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG1 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG1,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG2 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG2,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG3 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG3,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG4 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG4,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG5 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG5,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG6 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG6,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG7 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG7,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG8 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG8,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG9 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG9,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.FG10 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.FG10,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM1 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM1,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM2 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM2,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM3 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM3,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM4 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM4,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM5 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM5,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM6 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM6,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM7 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM7,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM8 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM8,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM9 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM9,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM10 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM10,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.RM11 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.RM11,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.CR1 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.CR1,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                  MapEntry("YES", "YES"),
                                  MapEntry("NO", "NO"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.TEST0 = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.TEST0,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.Location_Plants = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.Location_Plants,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                //isEnabled: true,
                                listdropdown: const [
                                  MapEntry("-", "-"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    ZONE00MASTERVAR.Location_Stock = d;
                                  });
                                },
                                value: ZONE00MASTERVAR.Location_Stock,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.User_Create,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.User_Create = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.User_Create_TMS,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.User_Create_TMS = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.User_Edit,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.User_Edit = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: ZONE00MASTERVAR.iscontrol,
                              fnContr: (input) {
                                ZONE00MASTERVAR.iscontrol = input;
                              },
                              sValue: ZONE00MASTERVAR.User_Edit_TMS,
                              returnfunc: (String s) {
                                ZONE00MASTERVAR.User_Edit_TMS = s;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (true) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              MASTER_TABLE_P_context.read<
                                      ZONE00MASTERTABLE_Bloc>()
                                  .add(ZONE00MASTERTABLE_SET());
                            },
                            // style: ButtonStyle(
                            //   backgroundColor:
                            //       MaterialStateProperty.all(Colors.red),
                            // ),
                            child: const Text("UPDATE"),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
