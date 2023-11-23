import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-01-01-Zone01MASTERTABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import 'Zone01VAR.dart';

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
        create: (_) => Zone01MASTERTABLE_Bloc(),
        child: BlocBuilder<Zone01MASTERTABLE_Bloc, List<INVAMASTERCLASS>>(
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
    context.read<Zone01MASTERTABLE_Bloc>().add(Zone01MASTERTABLE_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<INVAMASTERCLASS> _data = widget.data ?? [];
    // print(Zone01MASTERVAR.GROUP);
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
                isContr: Zone01MASTERVAR.iscontrol,
                fnContr: (input) {
                  Zone01MASTERVAR.iscontrol = input;
                },
                sValue: Zone01MASTERVAR.SEARCH,
                returnfunc: (String s) {
                  Zone01MASTERVAR.SEARCH = s;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: () {
                  Zone01MASTERVAR.MODE = 'NEW';
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
                      Zone01MASTERVAR.MODE = '';
                      _GETDATAMASTERpop(context);
                    },
                    RAWDATARETURNEDIT: (v, s) {
                      Zone01MASTERVAR.MODE = 'Edit';
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
            height: 1300,
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
                                  child: Center(child: Text("MATNAME")),
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
                                  child: Center(child: Text("TYPE")),
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
                                  child: Center(child: Text("USER")),
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
                                  child: Center(child: Text("UPDATEDATE")),
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
                                  child: Center(child: Text("USER_UPDATE")),
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
                                  child: Center(child: Text("BASE_UNIT")),
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
                                  child:
                                      Center(child: Text("Safty_Stock_UNIT")),
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
                                  child: Center(child: Text("ZONE")),
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
                                  child: Center(child: Text("LOCATION")),
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
                                  child: Center(child: Text("LOCATION_CLASS")),
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
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  Zone01MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: Zone01MASTERVAR.date,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.date = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  Zone01MASTERVAR.iscontrol = input;
                                });
                              },
                              sValue: Zone01MASTERVAR.UID,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.UID = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.GROUP = d;
                                  });
                                },
                                value: Zone01MASTERVAR.GROUP,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.MATID,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.MATID = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.MATNAME,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.MATNAME = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.TYPE = d;
                                  });
                                },
                                value: Zone01MASTERVAR.TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.USER,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.USER = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.UPDATEDATE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.UPDATEDATE = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: false,
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.USER_UPDATE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.USER_UPDATE = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.BASE_UNIT = d;
                                  });
                                },
                                value: Zone01MASTERVAR.BASE_UNIT,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.PACKET_SIZE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.PACKET_SIZE = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.PACKING_TYPE = d;
                                  });
                                },
                                value: Zone01MASTERVAR.PACKING_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.AGE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.AGE = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.AGE_TYPE = d;
                                  });
                                },
                                value: Zone01MASTERVAR.AGE_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.Safty_Stock,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.Safty_Stock = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.Safty_Stock_UNIT = d;
                                  });
                                },
                                value: Zone01MASTERVAR.Safty_Stock_UNIT,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.MATER_TYPE = d;
                                  });
                                },
                                value: Zone01MASTERVAR.MATER_TYPE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.LEAD,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.LEAD = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.LEAD_UNIT = d;
                                  });
                                },
                                value: Zone01MASTERVAR.LEAD_UNIT,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.CLASS,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.CLASS = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.MINAGE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.MINAGE = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.ITEMNAME_F_FULL,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.ITEMNAME_F_FULL = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.ITEMNAME_F,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.ITEMNAME_F = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.ITEMNAME_R_CODE,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.ITEMNAME_R_CODE = s;
                              },
                            ),
                            ComInputText(
                              height: 40,
                              width: 200,
                              isEnabled: Zone01MASTERVAR.MODE != '',
                              isContr: Zone01MASTERVAR.iscontrol,
                              fnContr: (input) {
                                Zone01MASTERVAR.iscontrol = input;
                              },
                              sValue: Zone01MASTERVAR.ITEMNAME_R_TD,
                              returnfunc: (String s) {
                                Zone01MASTERVAR.ITEMNAME_R_TD = s;
                              },
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.ZONE = d;
                                  });
                                },
                                value: Zone01MASTERVAR.ZONE,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.LOCATION = d;
                                  });
                                },
                                value: Zone01MASTERVAR.LOCATION,
                                height: 40,
                                width: 200,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: AdvanceDropDown(
                                isEnabled: Zone01MASTERVAR.MODE != '',
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("ONE", "1"),
                                  MapEntry("TWO", "2"),
                                  MapEntry("THREE", "3"),
                                ],
                                onChangeinside: (d) {
                                  setState(() {
                                    Zone01MASTERVAR.LOCATION_CLASS = d;
                                  });
                                },
                                value: Zone01MASTERVAR.LOCATION_CLASS,
                                height: 40,
                                width: 200,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (Zone01MASTERVAR.MODE != '') ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
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
