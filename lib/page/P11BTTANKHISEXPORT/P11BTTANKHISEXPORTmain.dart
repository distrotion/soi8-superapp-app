import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/11-1-01-P11BTTANKHISEXPORT.dart';
import '../../bloc/BlocEvent/21-1-01-REGISTERHIS.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/BTTANKHISitem.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P11BTTANKHISEXPORTvar.dart';

late BuildContext P11BTTANKHISEXPORTmaincontext;

class P11BTTANKHISEXPORTmain extends StatefulWidget {
  const P11BTTANKHISEXPORTmain({super.key});

  @override
  State<P11BTTANKHISEXPORTmain> createState() => _P11BTTANKHISEXPORTmainState();
}

class _P11BTTANKHISEXPORTmainState extends State<P11BTTANKHISEXPORTmain> {
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
        create: (_) => P11BTTANKHISEXPORT_Bloc(),
        child: BlocBuilder<P11BTTANKHISEXPORT_Bloc, List<BTTANKHISitem>>(
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
    P11BTTANKHISEXPORTvar.FPint = 0;
    P11BTTANKHISEXPORTvar.LPint = 0;
    P11BTTANKHISEXPORTvar.MAX = '1000';
    P11BTTANKHISEXPORTvar.pagelist = 0;
    P11BTTANKHISEXPORTvar.pageselect = 0;
    context.read<P11BTTANKHISEXPORT_Bloc>().add(P11BTTANKHISEXPORT_GET());
  }

  @override
  Widget build(BuildContext context) {
    P11BTTANKHISEXPORTmaincontext = context;
    List<BTTANKHISitem> _data = widget.data ?? [];

    if (_data.length != 0) {
      if (_data.length <= 500) {
        P11BTTANKHISEXPORTvar.FPint = 0;
        P11BTTANKHISEXPORTvar.LPint = _data.length;
      } else {
        if (_data.length > 0) {
          P11BTTANKHISEXPORTvar.pagelist = (_data.length ~/ 500);

          if (500 * P11BTTANKHISEXPORTvar.pagelist > _data.length) {
            P11BTTANKHISEXPORTvar.pagelist = P11BTTANKHISEXPORTvar.pagelist - 1;
          } else {
            P11BTTANKHISEXPORTvar.pagelist = P11BTTANKHISEXPORTvar.pagelist;
          }
          P11BTTANKHISEXPORTvar.FPint = 500 * P11BTTANKHISEXPORTvar.pageselect;
          if (P11BTTANKHISEXPORTvar.pageselect ==
              P11BTTANKHISEXPORTvar.pagelist) {
            // LPint = FPint + (_data.length - 500 * pagelist);
            P11BTTANKHISEXPORTvar.LPint = _data.length;
          } else {
            P11BTTANKHISEXPORTvar.LPint =
                500 * P11BTTANKHISEXPORTvar.pageselect + 500;
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
              //               P11BTTANKHISEXPORTvar.startDATE = v;
              //               P11BTTANKHISEXPORTvar.startDATElist = v.split('-');

              //               if (P11BTTANKHISEXPORTvar.startDATElist.isNotEmpty) {
              //                 P11BTTANKHISEXPORTvar.startDATEout.year =
              //                     P11BTTANKHISEXPORTvar.startDATElist[0];
              //                 P11BTTANKHISEXPORTvar.startDATEout.month =
              //                     P11BTTANKHISEXPORTvar.startDATElist[1];
              //                 P11BTTANKHISEXPORTvar.startDATEout.day =
              //                     P11BTTANKHISEXPORTvar.startDATElist[2];
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
              //               child: Text(P11BTTANKHISEXPORTvar.startDATE),
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
              //               P11BTTANKHISEXPORTvar.endDATE = v;
              //               P11BTTANKHISEXPORTvar.endDATElist = v.split('-');

              //               if (P11BTTANKHISEXPORTvar.endDATElist.isNotEmpty) {
              //                 P11BTTANKHISEXPORTvar.endDATEout.year =
              //                     P11BTTANKHISEXPORTvar.endDATElist[0];
              //                 P11BTTANKHISEXPORTvar.endDATEout.month =
              //                     P11BTTANKHISEXPORTvar.endDATElist[1];
              //                 P11BTTANKHISEXPORTvar.endDATEout.day =
              //                     P11BTTANKHISEXPORTvar.endDATElist[2];
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
              //               child: Text(P11BTTANKHISEXPORTvar.endDATE),
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       ComInputText(
              //         sPlaceholder: "MAX",
              //         height: 40,
              //         width: 400,
              //         isNumberOnly: true,
              //         isContr: P11BTTANKHISEXPORTvar.iscontrol,
              //         fnContr: (input) {
              //           P11BTTANKHISEXPORTvar.iscontrol = input;
              //         },
              //         sValue: P11BTTANKHISEXPORTvar.MAX,
              //         returnfunc: (String s) {
              //           P11BTTANKHISEXPORTvar.MAX = s;
              //         },
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8),
              //         child: InkWell(
              //           onTap: () {
              //             P11BTTANKHISEXPORTvar.FPint = 0;
              //             P11BTTANKHISEXPORTvar.LPint = 0;
              //             P11BTTANKHISEXPORTvar.pagelist = 0;
              //             P11BTTANKHISEXPORTvar.pageselect = 0;
              //             context
              //                 .read<P11BTTANKHISEXPORT_Bloc>()
              //                 .add(P11BTTANKHISEXPORT_GET());
              //           },
              //           child: Container(
              //             height: 40,
              //             width: 100,
              //             color: Colors.yellow,
              //             child: Center(
              //               child: Text("search"),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 40,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(right: 16),
              //               child: InkWell(
              //                 onTap: () {
              //                   //
              //                   if (P11BTTANKHISEXPORTvar.pageselect > 0) {
              //                     setState(() {
              //                       P11BTTANKHISEXPORTvar.pageselect--;
              //                     });
              //                   }
              //                 },
              //                 child: Container(
              //                   height: 24,
              //                   width: 24,
              //                   decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                               'assets/icons/icon-L@3x.png'))),
              //                 ),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 16),
              //               child: Text(
              //                   P11BTTANKHISEXPORTvar.pageselect.toString() +
              //                       " / " +
              //                       P11BTTANKHISEXPORTvar.pagelist.toString()),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 30),
              //               child: InkWell(
              //                 onTap: () {
              //                   //
              //                   if (P11BTTANKHISEXPORTvar.pageselect <
              //                       P11BTTANKHISEXPORTvar.pagelist) {
              //                     setState(() {
              //                       P11BTTANKHISEXPORTvar.pageselect++;
              //                     });
              //                   }
              //                 },
              //                 child: Container(
              //                   height: 24,
              //                   width: 24,
              //                   decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                               'assets/icons/icon-R@3x.png'))),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text("start"),
                        InkWell(
                          onTap: () {
                            CalendaSelectDate(context, DateTime.now(), (v) {
                              P11SumReportvar.startDATE = v;
                              P11SumReportvar.startDATElist = v.split('-');

                              if (P11SumReportvar.startDATElist.isNotEmpty) {
                                P11SumReportvar.startDATEout.year =
                                    P11SumReportvar.startDATElist[0];
                                P11SumReportvar.startDATEout.month =
                                    P11SumReportvar.startDATElist[1];
                                P11SumReportvar.startDATEout.day =
                                    P11SumReportvar.startDATElist[2];
                              }
                              setState(() {});
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Color(0x00b23127),
                              // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                              // image: DecorationImage(
                              //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                              //   fit: BoxFit.fitWidth,
                              // ),
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            height: 40,
                            width: 200,
                            child: Center(
                              child: Text(P11SumReportvar.startDATE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("end"),
                        InkWell(
                          onTap: () {
                            CalendaSelectDate(context, DateTime.now(), (v) {
                              P11SumReportvar.endDATE = v;
                              P11SumReportvar.endDATElist = v.split('-');

                              if (P11SumReportvar.endDATElist.isNotEmpty) {
                                P11SumReportvar.endDATEout.year =
                                    P11SumReportvar.endDATElist[0];
                                P11SumReportvar.endDATEout.month =
                                    P11SumReportvar.endDATElist[1];
                                P11SumReportvar.endDATEout.day =
                                    P11SumReportvar.endDATElist[2];
                              }
                              setState(() {});
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Color(0x00b23127),
                              // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                              // image: DecorationImage(
                              //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                              //   fit: BoxFit.fitWidth,
                              // ),
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            height: 40,
                            width: 200,
                            child: Center(
                              child: Text(P11SumReportvar.endDATE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          P11BTTANKHISEXPORTvar.FPint = 0;
                          P11BTTANKHISEXPORTvar.LPint = 0;
                          P11BTTANKHISEXPORTvar.pagelist = 0;
                          P11BTTANKHISEXPORTvar.pageselect = 0;
                          context
                              .read<P11BTTANKHISEXPORT_Bloc>()
                              .add(P11BTTANKHISEXPORT_GET_BYDATE());
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          P11BTTANKHISEXPORTvar.FPint = 0;
                          P11BTTANKHISEXPORTvar.LPint = 0;
                          P11BTTANKHISEXPORTvar.pagelist = 0;
                          P11BTTANKHISEXPORTvar.pageselect = 0;
                          context
                              .read<P11BTTANKHISEXPORT_Bloc>()
                              .add(P11BTTANKHISEXPORT_GET_BYDATE_EX());
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text("EXPORT"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
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
                                if (P11BTTANKHISEXPORTvar.pageselect > 0) {
                                  setState(() {
                                    P11BTTANKHISEXPORTvar.pageselect--;
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
                                P11BTTANKHISEXPORTvar.pageselect.toString() +
                                    " / " +
                                    P11BTTANKHISEXPORTvar.pagelist.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: InkWell(
                              onTap: () {
                                //
                                if (P11BTTANKHISEXPORTvar.pageselect <
                                    P11BTTANKHISEXPORTvar.pagelist) {
                                  setState(() {
                                    P11BTTANKHISEXPORTvar.pageselect++;
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
                      for (int i = P11BTTANKHISEXPORTvar.FPint;
                          i < P11BTTANKHISEXPORTvar.LPint;
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
