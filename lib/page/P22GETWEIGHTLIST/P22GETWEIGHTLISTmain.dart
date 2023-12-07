import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/22-1-01-SumReportGET.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Safty.dart';

import '../../widget/common/popup.dart';
import 'P22GETWEIGHTLISTvar.dart';

final GlobalKey _globalKey = GlobalKey();

late BuildContext GETWEIGHTLISTmaincontext;

class GETWEIGHTLISTmain extends StatefulWidget {
  GETWEIGHTLISTmain({
    Key? key,
    this.data,
  }) : super(key: key);
  int? data;

  @override
  State<GETWEIGHTLISTmain> createState() => _GETWEIGHTLISTmainState();
}

class _GETWEIGHTLISTmainState extends State<GETWEIGHTLISTmain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P22GETWEIGHTLISTvar.ischeck = false;
    P22GETWEIGHTLISTvar.MATINPUT = '';
  }

  @override
  Widget build(BuildContext context) {
    GETWEIGHTLISTmaincontext = context;
    if (widget.data == 2) {
      P22GETWEIGHTLISTvar.isMATINPUT = true;
      setState(() {
        P22GETWEIGHTLISTvar.MATINPUT = '';
      });
    }

    P22GETWEIGHTLISTvar.canregis = 0;

    return Center(
      child: SingleChildScrollView(
        child: RepaintBoundary(
          key: _globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: 350,
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
                        SizedBox(
                          height: 40,
                          width: 350,
                          child: ComInputText(
                            sPlaceholder: "MAT NO",
                            nLimitedChar: 18,
                            height: 40,
                            width: 350,
                            isEnabled: !P22GETWEIGHTLISTvar.ischeck,
                            isContr: P22GETWEIGHTLISTvar.isMATINPUT,
                            fnContr: (input) {
                              setState(() {
                                P22GETWEIGHTLISTvar.isMATINPUT = input;
                              });
                            },
                            sValue: P22GETWEIGHTLISTvar.MATINPUT,
                            returnfunc: (String s) {
                              P22GETWEIGHTLISTvar.MATINPUT = s;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          if (P22GETWEIGHTLISTvar.MATINPUT.length == 8) {
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
