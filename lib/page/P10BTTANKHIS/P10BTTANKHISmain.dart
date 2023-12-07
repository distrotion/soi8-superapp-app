import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/10-1-01-P10BTTANKHIS.dart';
import '../../bloc/BlocEvent/102-02-01-Zone01NEWITEMTABLE.dart';
import '../../bloc/BlocEvent/21-1-01-REGISTERHIS.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/BTTANKHISitem.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P10BTTANKHISvar.dart';

late BuildContext P10BTTANKHISmaincontext;

class P10BTTANKHISmain extends StatefulWidget {
  const P10BTTANKHISmain({super.key});

  @override
  State<P10BTTANKHISmain> createState() => _P10BTTANKHISmainState();
}

class _P10BTTANKHISmainState extends State<P10BTTANKHISmain> {
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
        create: (_) => P10BTTANKHIS_Bloc(),
        child: BlocBuilder<P10BTTANKHIS_Bloc, List<BTTANKHISitem>>(
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
  List<BTTANKHISitem>? data;
  @override
  State<NEW_ITEM> createState() => _NEW_ITEMState();
}

class _NEW_ITEMState extends State<NEW_ITEM> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //REGISTERHIS_GET
    P10BTTANKHISvar.FPint = 0;
    P10BTTANKHISvar.LPint = 0;
    P10BTTANKHISvar.MAX = '1000';
    P10BTTANKHISvar.pagelist = 0;
    P10BTTANKHISvar.pageselect = 0;
    context.read<P10BTTANKHIS_Bloc>().add(P10BTTANKHIS_GET());
  }

  @override
  Widget build(BuildContext context) {
    P10BTTANKHISmaincontext = context;
    List<BTTANKHISitem> _data = widget.data ?? [];

    if (_data.length != 0) {
      if (_data.length <= 500) {
        P10BTTANKHISvar.FPint = 0;
        P10BTTANKHISvar.LPint = _data.length;
      } else {
        if (_data.length > 0) {
          P10BTTANKHISvar.pagelist = (_data.length ~/ 500);

          if (500 * P10BTTANKHISvar.pagelist > _data.length) {
            P10BTTANKHISvar.pagelist = P10BTTANKHISvar.pagelist - 1;
          } else {
            P10BTTANKHISvar.pagelist = P10BTTANKHISvar.pagelist;
          }
          P10BTTANKHISvar.FPint = 500 * P10BTTANKHISvar.pageselect;
          if (P10BTTANKHISvar.pageselect == P10BTTANKHISvar.pagelist) {
            // LPint = FPint + (_data.length - 500 * pagelist);
            P10BTTANKHISvar.LPint = _data.length;
          } else {
            P10BTTANKHISvar.LPint = 500 * P10BTTANKHISvar.pageselect + 500;
            // LPint = _data.length;
          }
        }
      }
    }
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          // height: 4000,
          // width: 1280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              //               P10BTTANKHISvar.startDATE = v;
              //               P10BTTANKHISvar.startDATElist = v.split('-');

              //               if (P10BTTANKHISvar.startDATElist.isNotEmpty) {
              //                 P10BTTANKHISvar.startDATEout.year =
              //                     P10BTTANKHISvar.startDATElist[0];
              //                 P10BTTANKHISvar.startDATEout.month =
              //                     P10BTTANKHISvar.startDATElist[1];
              //                 P10BTTANKHISvar.startDATEout.day =
              //                     P10BTTANKHISvar.startDATElist[2];
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
              //             width: 5000,
              //             child: Center(
              //               child: Text(P10BTTANKHISvar.startDATE),
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
              //               P10BTTANKHISvar.endDATE = v;
              //               P10BTTANKHISvar.endDATElist = v.split('-');

              //               if (P10BTTANKHISvar.endDATElist.isNotEmpty) {
              //                 P10BTTANKHISvar.endDATEout.year =
              //                     P10BTTANKHISvar.endDATElist[0];
              //                 P10BTTANKHISvar.endDATEout.month =
              //                     P10BTTANKHISvar.endDATElist[1];
              //                 P10BTTANKHISvar.endDATEout.day =
              //                     P10BTTANKHISvar.endDATElist[2];
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
              //             width: 5000,
              //             child: Center(
              //               child: Text(P10BTTANKHISvar.endDATE),
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
              //             width: 5000,
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ComInputText(
                      sPlaceholder: "MAX",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: P10BTTANKHISvar.iscontrol,
                      fnContr: (input) {
                        P10BTTANKHISvar.iscontrol = input;
                      },
                      sValue: P10BTTANKHISvar.MAX,
                      returnfunc: (String s) {
                        P10BTTANKHISvar.MAX = s;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          P10BTTANKHISvar.FPint = 0;
                          P10BTTANKHISvar.LPint = 0;
                          P10BTTANKHISvar.pagelist = 0;
                          P10BTTANKHISvar.pageselect = 0;
                          context
                              .read<P10BTTANKHIS_Bloc>()
                              .add(P10BTTANKHIS_GET());
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          color: Colors.yellow,
                          child: Center(
                            child: Text("search"),
                          ),
                        ),
                      ),
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
                                if (P10BTTANKHISvar.pageselect > 0) {
                                  setState(() {
                                    P10BTTANKHISvar.pageselect--;
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
                            child: Text(P10BTTANKHISvar.pageselect.toString() +
                                " / " +
                                P10BTTANKHISvar.pagelist.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: InkWell(
                              onTap: () {
                                //
                                if (P10BTTANKHISvar.pageselect <
                                    P10BTTANKHISvar.pagelist) {
                                  setState(() {
                                    P10BTTANKHISvar.pageselect++;
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 580,
                width: 780,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BTTANKHIStable(),
                      //----------

                      // for (int i = 0; i < _data.length; i++) ...[
                      //   _data[i],
                      // ]
                      for (int i = P10BTTANKHISvar.FPint;
                          i < P10BTTANKHISvar.LPint;
                          i++) ...[
                        _data[i],
                      ]
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
