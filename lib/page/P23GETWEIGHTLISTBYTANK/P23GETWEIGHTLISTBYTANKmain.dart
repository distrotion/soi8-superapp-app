import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/22-1-01-SumReportGET.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Safty.dart';

import '../../widget/common/popup.dart';
import 'P23GETWEIGHTLISTBYTANKvar.dart';

final GlobalKey _globalKey = GlobalKey();

late BuildContext GETWEIGHTLISTBYTANKmaincontext;

class GETWEIGHTLISTBYTANKmain extends StatefulWidget {
  GETWEIGHTLISTBYTANKmain({
    Key? key,
    this.data,
  }) : super(key: key);
  int? data;

  @override
  State<GETWEIGHTLISTBYTANKmain> createState() =>
      _GETWEIGHTLISTBYTANKmainState();
}

class _GETWEIGHTLISTBYTANKmainState extends State<GETWEIGHTLISTBYTANKmain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P23GETWEIGHTLISTBYTANKvar.ischeck = false;
    P23GETWEIGHTLISTBYTANKvar.TANKNAME = '';
  }

  @override
  Widget build(BuildContext context) {
    GETWEIGHTLISTBYTANKmaincontext = context;
    if (widget.data == 2) {
      P23GETWEIGHTLISTBYTANKvar.isMATINPUT = true;
      setState(() {
        P23GETWEIGHTLISTBYTANKvar.TANKNAME = '';
      });
    }

    P23GETWEIGHTLISTBYTANKvar.canregis = 0;

    return Center(
      child: SingleChildScrollView(
        child: RepaintBoundary(
          key: _globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 600,
                width: 600,
                child: SingleChildScrollView(
                    child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text("start"),
                                InkWell(
                                  onTap: () {
                                    CalendaSelectDate(context, DateTime.now(),
                                        (v) {
                                      P23GETWEIGHTLISTBYTANKvar.startDATE = v;
                                      P23GETWEIGHTLISTBYTANKvar.startDATElist =
                                          v.split('-');

                                      if (P23GETWEIGHTLISTBYTANKvar
                                          .startDATElist.isNotEmpty) {
                                        P23GETWEIGHTLISTBYTANKvar
                                                .startDATEout.year =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .startDATElist[0];
                                        P23GETWEIGHTLISTBYTANKvar
                                                .startDATEout.month =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .startDATElist[1];
                                        P23GETWEIGHTLISTBYTANKvar
                                                .startDATEout.day =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .startDATElist[2];
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
                                      child: Text(
                                          P23GETWEIGHTLISTBYTANKvar.startDATE),
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
                                    CalendaSelectDate(context, DateTime.now(),
                                        (v) {
                                      P23GETWEIGHTLISTBYTANKvar.endDATE = v;
                                      P23GETWEIGHTLISTBYTANKvar.endDATElist =
                                          v.split('-');

                                      if (P23GETWEIGHTLISTBYTANKvar
                                          .endDATElist.isNotEmpty) {
                                        P23GETWEIGHTLISTBYTANKvar
                                                .endDATEout.year =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .endDATElist[0];
                                        P23GETWEIGHTLISTBYTANKvar
                                                .endDATEout.month =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .endDATElist[1];
                                        P23GETWEIGHTLISTBYTANKvar
                                                .endDATEout.day =
                                            P23GETWEIGHTLISTBYTANKvar
                                                .endDATElist[2];
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
                                      child: Text(
                                          P23GETWEIGHTLISTBYTANKvar.endDATE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          width: 350,
                          child: ComInputText(
                            sPlaceholder: "Liquid TANK",
                            nLimitedChar: 18,
                            height: 40,
                            width: 350,
                            isEnabled: !P23GETWEIGHTLISTBYTANKvar.ischeck,
                            isContr: P23GETWEIGHTLISTBYTANKvar.isMATINPUT,
                            fnContr: (input) {
                              setState(() {
                                P23GETWEIGHTLISTBYTANKvar.isMATINPUT = input;
                              });
                            },
                            sValue: P23GETWEIGHTLISTBYTANKvar.TANKNAME,
                            returnfunc: (String s) {
                              P23GETWEIGHTLISTBYTANKvar.TANKNAME = s;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _EXPORTDATA(
                              data: widget.data,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//ConverstStr

class _EXPORTDATA extends StatelessWidget {
  _EXPORTDATA({Key? key, this.data}) : super(key: key);
  int? data;
  @override
  Widget build(BuildContext context) {
    // if (data == 2) {
    //   BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
    //       "Success", "Register Success", enumNotificationlist.Success);
    // } else if (data == 1) {
    //   BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
    //       "Success", "POID have existed", enumNotificationlist.Warning);
    // }
    return InkWell(
        onTap: () {
          if (P23GETWEIGHTLISTBYTANKvar.TANKNAME.length == 8) {
            //
            context.read<GETWEIGHTLISTSGET_Bloc>().add(GETWEIGHTLISTSGET_GET());
          }
        },
        child: Container(
          width: 240,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Export Data",
              style: TextStyle(
                fontFamily: 'Mitr',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            ),
          ),
        ));
  }
}

// class _SAVE extends StatelessWidget {
//   _SAVE({Key? key, this.ReturnFN}) : super(key: key);
//   Function(String)? ReturnFN;
//   @override
//   Widget build(BuildContext context) {
//     // if (data == 2) {
//     //   BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
//     //       "Success", "Register Success", enumNotificationlist.Success);
//     // } else if (data == 1) {
//     //   BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
//     //       "Success", "POID have existed", enumNotificationlist.Warning);
//     // }
//     return InkWell(
//         onTap: () {
//           if (ReturnFN != null) {
//             ReturnFN!("ReturnFN");
//           }
//         },
//         child: Container(
//           height: 40,
//           width: 350,
//           decoration: BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: const Align(
//             alignment: Alignment.center,
//             child: Text(
//               "SAVE PIC",
//               style: TextStyle(
//                 fontFamily: 'Mitr',
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//                 fontStyle: FontStyle.normal,
//                 letterSpacing: 0,
//               ),
//             ),
//           ),
//         ));
//   }
// }

bool labeldata(String input) {
  bool output = false;
  if (double.parse(ConverstStr(input)) > 2 ||
      double.parse(ConverstStr(input)) < -2) {
    output = false;
  } else {
    output = true;
  }

  return output;
}
