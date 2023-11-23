import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/20-1-registerpo.dart';
import '../../bloc/BlocEvent/20-2-checkregis.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Safty.dart';

import '../../widget/common/popup.dart';
import 'P20REGISTORAPvar.dart';

final GlobalKey _globalKey = GlobalKey();

class RegisterBox extends StatefulWidget {
  RegisterBox({
    Key? key,
    this.data,
    this.Listdata,
  }) : super(key: key);
  int? data;
  List<checkregisc>? Listdata;

  @override
  State<RegisterBox> createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P20REGISTORAPvar.ischeck = false;
    P20REGISTORAPvar.POINPUT = '';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == 2) {
      P20REGISTORAPvar.isPOINPUT = true;
      setState(() {
        P20REGISTORAPvar.POINPUT = '';
      });
    }
    List<checkregisc> _Listdata = widget.Listdata ?? [];
    P20REGISTORAPvar.canregis = 0;
    for (int i = 0; i < _Listdata.length; i++) {
      if (!labeldata(
          '${(((double.parse(ConverstStr(_Listdata[i].NumAct)) / double.parse(ConverstStr(_Listdata[i].NumSp))) * 100) - 100).toStringAsFixed(2)}')) {
        P20REGISTORAPvar.canregis = 2;
        break;
      }

      if (_Listdata[0].StrChemical == 'END') {
        P20REGISTORAPvar.canregis = 1;
      }
      if (_Listdata[_Listdata.length - 1].StrChemical == 'END') {
        P20REGISTORAPvar.canregis = 1;
      }
    }
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
                            nLimitedChar: 18,
                            height: 40,
                            width: 350,
                            isEnabled: !P20REGISTORAPvar.ischeck,
                            isContr: P20REGISTORAPvar.isPOINPUT,
                            fnContr: (input) {
                              setState(() {
                                P20REGISTORAPvar.isPOINPUT = input;
                              });
                            },
                            sValue: P20REGISTORAPvar.POINPUT,
                            returnfunc: (String s) {
                              P20REGISTORAPvar.POINPUT = s;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _CheckButton(
                              data: widget.data,
                            ),
                            _clearkButton(
                              data: widget.data,
                            )
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
              if (_Listdata.length > 0) ...[
                Container(
                  height: 50,
                  width: 350,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "StrChemical",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "SP",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "Actual",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              '%dip',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              for (int i = 0; i < _Listdata.length; i++) ...[
                Container(
                  height: 50,
                  width: 350,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(_Listdata[i].StrChemical),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(_Listdata[i].NumSp),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(_Listdata[i].NumAct),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: labeldata(
                                    '${(((double.parse(ConverstStr(_Listdata[i].NumAct)) / double.parse(ConverstStr(_Listdata[i].NumSp))) * 100) - 100).toStringAsFixed(2)}')
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                '${(((double.parse(ConverstStr(_Listdata[i].NumAct)) / double.parse(ConverstStr(_Listdata[i].NumSp))) * 100) - 100).toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (P20REGISTORAPvar.canregis == 1) ...[
                SizedBox(
                  height: 6,
                ),
                _RegisterButton(
                  data: widget.data,
                ),
              ] else if (P20REGISTORAPvar.canregis == 2) ...[
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 40,
                  width: 350,
                  child: ComInputText(
                    height: 40,
                    width: 350,
                    nLimitedChar: 200,
                    isContr: P20REGISTORAPvar.isPOINPUT,
                    fnContr: (input) {
                      P20REGISTORAPvar.isPOINPUT = input;
                    },
                    sValue: P20REGISTORAPvar.COMMENT,
                    returnfunc: (String s) {
                      P20REGISTORAPvar.COMMENT = s;
                    },
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                // _SAVE(
                //   ReturnFN: (v) {},
                // )
                _RegisterButton(
                  data: widget.data,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
//ConverstStr

class _CheckButton extends StatelessWidget {
  _CheckButton({Key? key, this.data}) : super(key: key);
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
          if (P20REGISTORAPvar.POINPUT.length == 18) {
            //
            // context.read<RegisterPOID_Bloc>().add(RegisterPOID_Pressed());
            P20REGISTORAPvar.COMMENT = '';
            P20REGISTORAPvar.ischeck = true;
            context.read<checkregis_Bloc>().add(checkregis_get());
            //
          }
        },
        child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Check Weight",
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

class _clearkButton extends StatefulWidget {
  _clearkButton({Key? key, this.data}) : super(key: key);
  int? data;

  @override
  State<_clearkButton> createState() => _clearkButtonState();
}

class _clearkButtonState extends State<_clearkButton> {
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
          if (P20REGISTORAPvar.POINPUT.length == 18) {
            //

            P20REGISTORAPvar.ischeck = false;
            context.read<checkregis_Bloc>().add(checkregis_flush());

            //
          }
        },
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "clear",
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

class _RegisterButton extends StatelessWidget {
  _RegisterButton({Key? key, this.data}) : super(key: key);
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
          if (P20REGISTORAPvar.COMMENT.length > 10) {
            if (P20REGISTORAPvar.POINPUT.length == 18) {
              //
              P20REGISTORAPvar.ischeck = false;

              context.read<RegisterPOID_Bloc>().add(RegisterPOID_Pressed());
              context.read<checkregis_Bloc>().add(checkregis_flush());
              // context.read<checkregis_Bloc>().add(checkregis_get());
              //
            }
          } else {
            WORNINGpop(
                context,
                ["", "Error", "", "Please comment morethan", "10 cha."],
                200,
                250);
          }
        },
        child: Container(
          height: 40,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Register",
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
