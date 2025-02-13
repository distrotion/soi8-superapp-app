import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/21-1-01-REGISTERHIS.dart';
import '../../bloc/BlocEvent/31-1-01-P31QCSAPMASTER.dart';

import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/QCSAPMASTERtable.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/SENDTOSAPHIStable.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P31QCSAPMASTERvar.dart';

late BuildContext P31QCSAPMASTERmaincontext;

class P31QCSAPMASTERmain extends StatefulWidget {
  const P31QCSAPMASTERmain({super.key});

  @override
  State<P31QCSAPMASTERmain> createState() => _P31QCSAPMASTERmainState();
}

class _P31QCSAPMASTERmainState extends State<P31QCSAPMASTERmain> {
  @override
  Widget build(BuildContext context) {
    return _NEW_ITEM_BLOC();
  }
}

class _NEW_ITEM_BLOC extends StatelessWidget {
  /// {@macro counter_page}
  const _NEW_ITEM_BLOC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => QCSAPMASTER_Bloc(),
        child: BlocBuilder<QCSAPMASTER_Bloc, List<QCSAPMASTERitem>>(
          builder: (context, data) {
            return NEW_ITEM(data: data);
          },
        ));
  }
}

class NEW_ITEM extends StatefulWidget {
  NEW_ITEM({
    super.key,
    this.data,
  });
  List<QCSAPMASTERitem>? data;
  @override
  State<NEW_ITEM> createState() => _NEW_ITEMState();
}

class _NEW_ITEMState extends State<NEW_ITEM> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //REGISTERHIS_GET
    context.read<QCSAPMASTER_Bloc>().add(QCSAPMASTER_GET());
    P31QCSAPMASTERvar.SEARCH = '';
  }

  @override
  Widget build(BuildContext context) {
    P31QCSAPMASTERmaincontext = context;
    List<QCSAPMASTERitem> _data = widget.data ?? [];
    List<QCSAPMASTERitem> _datas = _data;

    if (P31QCSAPMASTERvar.SEARCH != '') {
      _datas = [];
      for (var i = 0; i < _data.length; i++) {
        if (_data[i]
                .text01!
                .toUpperCase()
                .contains(P31QCSAPMASTERvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text02!
                .toUpperCase()
                .contains(P31QCSAPMASTERvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text03!
                .toUpperCase()
                .contains(P31QCSAPMASTERvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text04!
                .toUpperCase()
                .contains(P31QCSAPMASTERvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text05!
                .toUpperCase()
                .contains(P31QCSAPMASTERvar.SEARCH.toUpperCase())) {
          _datas.add(_data[i]);
        }
      }
    }

    if (_datas.length != 0) {
      if (_datas.length <= 100) {
        P31QCSAPMASTERvar.FPint = 0;
        P31QCSAPMASTERvar.LPint = _datas.length;
      } else {
        if (_datas.length > 0) {
          P31QCSAPMASTERvar.pagelist = (_datas.length ~/ 100);

          if (100 * P31QCSAPMASTERvar.pagelist > _datas.length) {
            P31QCSAPMASTERvar.pagelist = P31QCSAPMASTERvar.pagelist - 1;
          } else {
            P31QCSAPMASTERvar.pagelist = P31QCSAPMASTERvar.pagelist;
          }
          P31QCSAPMASTERvar.FPint = 100 * P31QCSAPMASTERvar.pageselect;
          if (P31QCSAPMASTERvar.pageselect == P31QCSAPMASTERvar.pagelist) {
            // LPint = FPint + (_datas.length - 100 * pagelist);
            P31QCSAPMASTERvar.LPint = _datas.length;
          } else {
            P31QCSAPMASTERvar.LPint = 100 * P31QCSAPMASTERvar.pageselect + 100;
            // LPint = _datas.length;
          }
        }
      }
    }
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 720,
          // width: 1280,
          child: Column(
            children: [
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Column(
              //       children: [
              //         Text("start"),
              //         InkWell(
              //           onTap: () {
              //             CalendaSelectDate(context, DateTime.now(), (v) {
              //               P31QCSAPMASTERvar.startDATE = v;
              //               P31QCSAPMASTERvar.startDATElist = v.split('-');

              //               if (P31QCSAPMASTERvar.startDATElist.isNotEmpty) {
              //                 P31QCSAPMASTERvar.startDATEout.year =
              //                     P31QCSAPMASTERvar.startDATElist[0];
              //                 P31QCSAPMASTERvar.startDATEout.month =
              //                     P31QCSAPMASTERvar.startDATElist[1];
              //                 P31QCSAPMASTERvar.startDATEout.day =
              //                     P31QCSAPMASTERvar.startDATElist[2];
              //               }
              //               setState(() {});
              //             });
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               // color: Color(0x00b23127),
              //               // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

              //               // image: DecorationImage(
              //               //   image: AssetImage("assets/icons/groupNEW@3x.png"),
              //               //   fit: BoxFit.fitWidth,
              //               // ),
              //               border: Border.all(color: Colors.black),
              //               borderRadius: const BorderRadius.only(
              //                 topLeft: Radius.circular(8.0),
              //                 topRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0),
              //                 bottomRight: Radius.circular(8.0),
              //               ),
              //             ),
              //             height: 40,
              //             width: 200,
              //             child: Center(
              //               child: Text(P31QCSAPMASTERvar.startDATE),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Text("end"),
              //         InkWell(
              //           onTap: () {
              //             CalendaSelectDate(context, DateTime.now(), (v) {
              //               P31QCSAPMASTERvar.endDATE = v;
              //               P31QCSAPMASTERvar.endDATElist = v.split('-');

              //               if (P31QCSAPMASTERvar.endDATElist.isNotEmpty) {
              //                 P31QCSAPMASTERvar.endDATEout.year =
              //                     P31QCSAPMASTERvar.endDATElist[0];
              //                 P31QCSAPMASTERvar.endDATEout.month =
              //                     P31QCSAPMASTERvar.endDATElist[1];
              //                 P31QCSAPMASTERvar.endDATEout.day =
              //                     P31QCSAPMASTERvar.endDATElist[2];
              //               }
              //               setState(() {});
              //             });
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               // color: Color(0x00b23127),
              //               // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

              //               // image: DecorationImage(
              //               //   image: AssetImage("assets/icons/groupNEW@3x.png"),
              //               //   fit: BoxFit.fitWidth,
              //               // ),
              //               border: Border.all(color: Colors.black),
              //               borderRadius: const BorderRadius.only(
              //                 topLeft: Radius.circular(8.0),
              //                 topRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0),
              //                 bottomRight: Radius.circular(8.0),
              //               ),
              //             ),
              //             height: 40,
              //             width: 200,
              //             child: Center(
              //               child: Text(P31QCSAPMASTERvar.endDATE),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         SizedBox(
              //           height: 16,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 16),
              //           child: Container(
              //             width: 200,
              //             height: 40,
              //             color: Colors.blue,
              //             child: Center(
              //               child: Text("SELECT"),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ComInputText(
                      sPlaceholder: "search",
                      height: 40,
                      width: 400,
                      isContr: P31QCSAPMASTERvar.iscontrol,
                      fnContr: (input) {
                        P31QCSAPMASTERvar.iscontrol = input;
                      },
                      sValue: P31QCSAPMASTERvar.SEARCH,
                      returnfunc: (String s) {
                        setState(() {
                          P31QCSAPMASTERvar.SEARCH = s;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: () {
                                //
                                if (P31QCSAPMASTERvar.pageselect > 0) {
                                  setState(() {
                                    P31QCSAPMASTERvar.pageselect--;
                                  });
                                }
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/icon-L@3x.png'))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                                P31QCSAPMASTERvar.pageselect.toString() +
                                    " / " +
                                    P31QCSAPMASTERvar.pagelist.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: InkWell(
                              onTap: () {
                                //
                                if (P31QCSAPMASTERvar.pageselect <
                                    P31QCSAPMASTERvar.pagelist) {
                                  setState(() {
                                    P31QCSAPMASTERvar.pageselect++;
                                  });
                                }
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/icon-R@3x.png'))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 580,
                width: 780,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      QCSAPMASTERtable(),
                      //----------

                      // for (int i = 0; i < _datas.length; i++) ...[
                      //   _datas[i],
                      // ]
                      for (int i = P31QCSAPMASTERvar.FPint;
                          i < P31QCSAPMASTERvar.LPint;
                          i++) ...[
                        // _data[i],

                        if (_datas.length > 0) ...[
                          QCSAPMASTERitem(
                            text01: _datas[i].text01,
                            text02: _datas[i].text02,
                            text03: _datas[i].text03,
                            text04: _datas[i].text04,
                            text05: _datas[i].text05,
                            text06: _datas[i].text06,
                            text07: _datas[i].text07,
                            text08: _datas[i].text08,
                            text09: _datas[i].text09,
                            setupreturn: ((v) {
                              // print(v);
                              _GETDATASAPpop(context, _datas[i].text01 ?? '',
                                  _datas[i].text02 ?? '');
                            }),
                          ),
                        ],
                      ],
                    ],
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

void _GETDATASAPpop(
  BuildContext contextin,
  String MKMNR,
  String Material,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return _SETDATASAP(
        contextin: context,
        MKMNR: MKMNR,
        Material: Material,
      );
    },
  );
}

class _SETDATASAP extends StatefulWidget {
  _SETDATASAP({
    super.key,
    this.contextin,
    this.MKMNR,
    this.Material,
  });
  BuildContext? contextin;
  String? MKMNR;
  String? Material;

  @override
  State<_SETDATASAP> createState() => __SETDATASAPState();
}

class __SETDATASAPState extends State<_SETDATASAP> {
  @override
  Widget build(BuildContext context) {
    P31QCSAPMASTERvar.MKMNR = widget.MKMNR ?? '';
    return Dialog(
      child: Container(
        height: 300,
        width: 400,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  height: 40,
                  width: 350,
                  // color: Colors.blue,
                  child: Center(
                    child: Text('MKMNR : ' + (widget.MKMNR ?? '')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  height: 40,
                  width: 350,
                  // color: Colors.blue,
                  child: Center(
                    child: Text("Material :" + (widget.Material ?? '')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SizedBox(
                  height: 40,
                  child: AdvanceDropDown(
                    //isEnabled: true,
                    listdropdown: const [
                      MapEntry("-", "-"),
                      MapEntry("APPEARANCE", "APPEARANCE"),
                      MapEntry("COLOR", "COLOR"),
                      MapEntry("AV", "AV"),
                      MapEntry("AL", "AL"),
                      MapEntry("EC", "EC"),
                      MapEntry("CE", "CE"),
                      MapEntry("PH", "PH"),
                      MapEntry("FA", "FA"),
                      MapEntry("FT", "FT"),
                      MapEntry("FP", "FP"),
                      MapEntry("TA", "TA"),
                      MapEntry("TC", "TC"),
                      MapEntry("SG", "SG"),
                      MapEntry("SV", "SV"),
                      MapEntry("MN", "MN"),
                      MapEntry("NI", "NI"),
                      MapEntry("ZR", "ZR"),
                      MapEntry("ZN", "ZN"),
                      MapEntry("CR3", "CR3"),
                      MapEntry("MOI", "MOI"),
                      MapEntry("NVC", "NVC"),
                      MapEntry("TAV", "TAV"),
                      MapEntry("TCr", "TCr"),
                      MapEntry("F_Al", "F_Al"),
                      MapEntry("T_Al", "T_Al"),
                      MapEntry("ACO", "ACO"),
                      MapEntry("Starch", "Starch"),
                      MapEntry("BABCOCK", "BABCOCK"),
                      MapEntry("PURITY", "PURITY"),
                      MapEntry("FACTOR", "FACTOR"),
                      MapEntry("Brix", "Brix"),
                      MapEntry("PaticleSize", "PaticleSize"),
                      MapEntry("SOLID", "SOLID"),
                      MapEntry("THOP", "THOP"),
                      MapEntry("FHOP", "FHOP"),
                      MapEntry("Viscosity", "Viscosity"),
                      MapEntry("DENSITY", "DENSITY"),
                    ],

                    //SOLID Starch
                    onChangeinside: (d) {
                      setState(() {
                        P31QCSAPMASTERvar.SETTOSAP = d;
                      });
                    },
                    value: P31QCSAPMASTERvar.SETTOSAP,
                    height: 40,
                    width: 350,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: InkWell(
                  onTap: () {
                    P31QCSAPMASTERmaincontext.read<QCSAPMASTER_Bloc>()
                        .add(QCSAPMASTER_SET());
                    // Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 350,
                    color: Colors.blue,
                    child: Center(
                      child: Text("SET"),
                    ),
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
