// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P221-01-P221PRODUCTIONCONFIRMATIONSMget.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/newtable/PRODUCTIONCONFIRMATIONtable.dart';
import '../P310CHEMTANK/P310CHEMTANKVAR.dart';
import '../page310.dart';
import 'P221PRODUCTIONCONFIRMATIONSMVAR.dart';

late BuildContext P221PRODUCTIONCONFIRMATIONSMcontext;

class P221PRODUCTIONCONFIRMATIONSM extends StatefulWidget {
  P221PRODUCTIONCONFIRMATIONSM({
    super.key,
    this.data,
  });
  List<P221PRODUCTIONCONFIRMATIONSMgetclass>? data;

  @override
  State<P221PRODUCTIONCONFIRMATIONSM> createState() =>
      _P221PRODUCTIONCONFIRMATIONSMState();
}

class _P221PRODUCTIONCONFIRMATIONSMState
    extends State<P221PRODUCTIONCONFIRMATIONSM> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var now3d = DateTime.now().subtract(const Duration(days: 1));
    // P221PRODUCTIONCONFIRMATIONSMVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P221PRODUCTIONCONFIRMATIONSMVAR.day = DateFormat('dd').format(now3d);
    P221PRODUCTIONCONFIRMATIONSMVAR.month = DateFormat('MM').format(now3d);
    P221PRODUCTIONCONFIRMATIONSMVAR.year = DateFormat('yyyy').format(now3d);

    P221PRODUCTIONCONFIRMATIONSMVAR.day_next = DateFormat('dd').format(now);
    P221PRODUCTIONCONFIRMATIONSMVAR.month_next = DateFormat('MM').format(now);
    P221PRODUCTIONCONFIRMATIONSMVAR.year_next = DateFormat('yyyy').format(now);

    // P221PRODUCTIONCONFIRMATIONSMVAR.day_next = "05";
    // P221PRODUCTIONCONFIRMATIONSMVAR.month_next = "04";
    // P221PRODUCTIONCONFIRMATIONSMVAR.year_next = "2025";

    P221PRODUCTIONCONFIRMATIONSMVAR.iscontrol = true;
    P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH = '';
    P221PRODUCTIONCONFIRMATIONSMVAR.holding = 999;

    context
        .read<P221PRODUCTIONCONFIRMATIONSMget_Bloc>()
        .add(P221PRODUCTIONCONFIRMATIONSMget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P221PRODUCTIONCONFIRMATIONSMcontext = context;
    List<P221PRODUCTIONCONFIRMATIONSMgetclass> _datain = widget.data ?? [];
    List<P221PRODUCTIONCONFIRMATIONSMgetclass> _datasearch = [];

    //  text01: _datain[i].PROCESS_ORDER,
    //                             text02: _datain[i].MATERIAL,
    //                             text03: _datain[i].MATERIAL_TEXT,
    //                             text04: _datain[i].PROD_SUP_DESC,
    //                             text05: _datain[i].PROD_SUP,
    //                             text06: _datain[i].BATCH,

    List<P221PRODUCTIONCONFIRMATIONSMgetclass> _data_exp = [];

    for (int i = 0; i < _datain.length; i++) {
      if (_datain[i]
              .PROCESS_ORDER
              .contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH) ||
          _datain[i]
              .MATERIAL
              .contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH) ||
          _datain[i]
              .MATERIAL_TEXT
              .contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH) ||
          _datain[i]
              .PROD_SUP_DESC
              .contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH) ||
          _datain[i]
              .PROD_SUP
              .contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH) ||
          _datain[i].BATCH.contains(P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH)) {
        _data_exp.add(_datain[i]);
      }
    }

    Widget outset = Column(
      children: [
        for (int i = 0; i < _data_exp.length; i++) ...[
          // for (int i = 0; i < 10; i++) ...[
          InkWell(
            onTap: () {
              //
              P221PRODUCTIONCONFIRMATIONSMVAR.PROCESS_ORDERselect =
                  _data_exp[i].PROCESS_ORDER;

              P310CHEMTANKVAR.PLANT = _data_exp[i].PROD_SUP_DESC;
              P310CHEMTANKVAR.MATERIAL = _data_exp[i].MATERIAL;
              P310CHEMTANKVAR.ORDER = _data_exp[i].LINK_PROC_ORDER;
              P221PRODUCTIONCONFIRMATIONSMVAR.datasetsend = _data_exp[i];
              P310CHEMTANKVAR.dataac = '';
              _POPUPCREATEUSERSW(context);

              // print(_datain[i].PROCESS_ORDER);
            },
            onHover: (v) {
              //
              // print(v.toString() + ":" + i.toString());
              setState(() {
                P221PRODUCTIONCONFIRMATIONSMVAR.holding = i;
              });
            },
            child: PRODUCTIONCONFIRMATIONitem(
              holding: P221PRODUCTIONCONFIRMATIONSMVAR.holding == i,
              text01: _data_exp[i].PROCESS_ORDER,
              text02: _data_exp[i].MATERIAL,
              text03: _data_exp[i].MATERIAL_TEXT,
              text04: _data_exp[i].PROD_SUP_DESC,
              text05: _data_exp[i].PROD_SUP,
              text06: _data_exp[i].BATCH,
              text07: (_data_exp[i].Yield != '')
                  ? (_data_exp[i].Yield + ' ' + _data_exp[i].UOM)
                  : '',
              text08: _data_exp[i].STATUS,
              text09: _data_exp[i].SYSTEM_STATUS,
              // text09: _data_exp[i].SYSTEM_STATUS,
              //SYSTEM_STATUS
              text10: "-",
            ),
          ),
        ],
      ],
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .ChangePage_nodrower('', Page202());
                        },
                        child: SizedBox(
                          width: 200,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: const [
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'SELECT OPERATION PROGRESS',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .ChangePage_nodrower('', Page1());
                        },
                        child: SizedBox(
                          width: 200,
                          // child: Icon(
                          //   Icons.arrow_back_ios,
                          //   size: 40,
                          //   color: Colors.blue,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    // width: 900,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "บริษัท ไทยปาร์คเกอร์ไรซิ่ง จำกัด",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    // width: 900,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "PRODUCTION CONFIRMATION TABLE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DateTime calendaset = DateTime.now();
                      //
                      CalendaSelectDates(context, calendaset,
                          (day, month, year) {
                        //
                        P221PRODUCTIONCONFIRMATIONSMVAR.day = day;
                        P221PRODUCTIONCONFIRMATIONSMVAR.month = month;
                        P221PRODUCTIONCONFIRMATIONSMVAR.year = year;

                        setState(() {});
                        context
                            .read<P221PRODUCTIONCONFIRMATIONSMget_Bloc>()
                            .add(P221PRODUCTIONCONFIRMATIONSMget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade900,
                        border: Border(
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "วันที่ : ${P221PRODUCTIONCONFIRMATIONSMVAR.day}-${P221PRODUCTIONCONFIRMATIONSMVAR.month}-${P221PRODUCTIONCONFIRMATIONSMVAR.year}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DateTime calendaset = DateTime.now();
                      //
                      CalendaSelectDates(context, calendaset,
                          (day, month, year) {
                        //
                        P221PRODUCTIONCONFIRMATIONSMVAR.day_next = day;
                        P221PRODUCTIONCONFIRMATIONSMVAR.month_next = month;
                        P221PRODUCTIONCONFIRMATIONSMVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P221PRODUCTIONCONFIRMATIONSMget_Bloc>()
                            .add(P221PRODUCTIONCONFIRMATIONSMget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade900,
                        border: Border(
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "ถึงวันที่ : ${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}-${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}-${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    // width: 900,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ComInputText(
                          height: 40,
                          width: 500,
                          isContr: P221PRODUCTIONCONFIRMATIONSMVAR.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              P221PRODUCTIONCONFIRMATIONSMVAR.iscontrol = input;
                            });
                          },
                          sPlaceholder: "search",
                          sValue: P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH,
                          returnfunc: (String s) {
                            setState(() {
                              P221PRODUCTIONCONFIRMATIONSMVAR.SEARCH = s;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  PRODUCTIONCONFIRMATIONtable(),
                  // if (_datasearch
                  //     .any((item) => item.PLANT == 'noxrust'))
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: outset,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
              child: Page310(),
            ),
          ),
        ),
      );
    },
  );
}

// void _POPUPCREATEUSERSW(BuildContext contextin) {
//   showDialog(
//     context: contextin,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: SingleChildScrollView(
//             child: Container(
//               height: 600,
//               width: 800,
//               color: Colors.white,
//               // child: Page43(),
//               child: _DATAGETSETbloc(),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// class _DATAGETSETbloc extends StatelessWidget {
//   const _DATAGETSETbloc({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => P221PRODUCTIONCONFIRMATIONSMgetsub_Bloc(),
//         child: BlocBuilder<P221PRODUCTIONCONFIRMATIONSMgetsub_Bloc,
//             List<P221PRODUCTIONCONFIRMATIONSMgetsubclass>>(
//           builder: (context, data) {
//             return _DATAGETSET(
//               data: data,
//             );
//           },
//         ));
//   }
// }

// class _DATAGETSET extends StatefulWidget {
//   _DATAGETSET({
//     super.key,
//     this.data,
//   });
//   List<P221PRODUCTIONCONFIRMATIONSMgetsubclass>? data;

//   @override
//   State<_DATAGETSET> createState() => __DATAGETSETState();
// }

// class __DATAGETSETState extends State<_DATAGETSET> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context
//         .read<P221PRODUCTIONCONFIRMATIONSMgetsub_Bloc>()
//         .add(P221PRODUCTIONCONFIRMATIONSMgetsub_GET());
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<P221PRODUCTIONCONFIRMATIONSMgetsubclass> _data = widget.data ?? [];
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           PLANINGSUBtable(),
//           // if (_datasearch
//           //     .any((item) => item.PLANT == 'noxrust'))
//           SizedBox(
//             height: 500,
//             child: SingleChildScrollView(
//               child: Container(
//                 // width: 1100,
//                 child: Column(
//                   children: [
//                     for (int i = 0; i < _data.length; i++) ...[
//                       // for (int i = 0; i < 10; i++) ...[
//                       PLANINGSUBitem(
//                         text01: _data[i].ITEM,
//                         text02: _data[i].MATERIAL_TEXT,
//                         text03: _data[i].REQ_QTY,
//                         text04: _data[i].BATCH,
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //P221PRODUCTIONCONFIRMATIONSMgetsubclass