// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:html';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P224-01-P221PRODUCTIONCONFIRMATIONSMYMget.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../model/model.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/common/Safty.dart';
import '../../widget/newtable/PRODUCTIONCONFIRMATIONYEtable.dart';
import '../../widget/newtable/PRODUCTIONCONFIRMATIONtable.dart';
import '../P310CHEMTANK/P310CHEMTANKVAR.dart';
import '../page310.dart';
import '../page60.dart';
import 'P224PRODUCTIONCONFIRMATIONSMYEVAR.dart';

late BuildContext P224PRODUCTIONCONFIRMATIONSMYEcontext;

class P224PRODUCTIONCONFIRMATIONSMYE extends StatefulWidget {
  P224PRODUCTIONCONFIRMATIONSMYE({
    super.key,
    this.data,
  });
  List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>? data;

  @override
  State<P224PRODUCTIONCONFIRMATIONSMYE> createState() =>
      _P224PRODUCTIONCONFIRMATIONSMYEState();
}

class _P224PRODUCTIONCONFIRMATIONSMYEState
    extends State<P224PRODUCTIONCONFIRMATIONSMYE> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var now3d = DateTime.now().subtract(const Duration(days: 0));
    // P224PRODUCTIONCONFIRMATIONSMYEVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P224PRODUCTIONCONFIRMATIONSMYEVAR.day = DateFormat('dd').format(now3d);
    P224PRODUCTIONCONFIRMATIONSMYEVAR.month = DateFormat('MM').format(now3d);
    P224PRODUCTIONCONFIRMATIONSMYEVAR.year = DateFormat('yyyy').format(now3d);

    P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next = DateFormat('dd').format(now);
    P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next = DateFormat('MM').format(now);
    P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next =
        DateFormat('yyyy').format(now);

    // P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next = "05";
    // P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next = "04";
    // P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next = "2025";

    P224PRODUCTIONCONFIRMATIONSMYEVAR.iscontrol = true;
    P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH = '';
    P224PRODUCTIONCONFIRMATIONSMYEVAR.holding = 999;

    context
        .read<P224PRODUCTIONCONFIRMATIONSMYEget_Bloc>()
        .add(P224PRODUCTIONCONFIRMATIONSMYEget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P224PRODUCTIONCONFIRMATIONSMYEcontext = context;
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> _datain = widget.data ?? [];
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> _datasearch = [];

    //  text01: _datain[i].PROCESS_ORDER,
    //                             text02: _datain[i].MATERIAL,
    //                             text03: _datain[i].MATERIAL_TEXT,
    //                             text04: _datain[i].PROD_SUP_DESC,
    //                             text05: _datain[i].PROD_SUP,
    //                             text06: _datain[i].BATCH,

    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> _data_exp = [];

    for (int i = 0; i < _datain.length; i++) {
      if (_datain[i]
              .PROCESS_ORDER
              .contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH) ||
          _datain[i]
              .MATERIAL
              .contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH) ||
          _datain[i]
              .MATERIAL_TEXT
              .contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH) ||
          _datain[i]
              .PROD_SUP_DESC
              .contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH) ||
          _datain[i]
              .PROD_SUP
              .contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH) ||
          _datain[i].BATCH.contains(P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH)) {
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
              // P224PRODUCTIONCONFIRMATIONSMYEVAR.PROCESS_ORDERselect =
              //     _data_exp[i].PROCESS_ORDER;

              // P310CHEMTANKVAR.PLANT = _data_exp[i].PROD_SUP_DESC;
              // P310CHEMTANKVAR.MATERIAL = _data_exp[i].MATERIAL;
              // P310CHEMTANKVAR.Fml = _data_exp[i].MATERIAL_TEXT;
              // P310CHEMTANKVAR.ORDER = _data_exp[i].LINK_PROC_ORDER;
              // P224PRODUCTIONCONFIRMATIONSMYEVAR.datasetsend = _data_exp[i];
              // P310CHEMTANKVAR.dataac = '';
              // //
              // P310CHEMTANKVAR.ADD1 = '';
              // P310CHEMTANKVAR.ADD2 = '';
              // P310CHEMTANKVAR.ADD3 = '';
              // P310CHEMTANKVAR.ADD4 = '';
              // P310CHEMTANKVAR.ADD5 = '';
              // //
              // _POPUPCREATEUSERSW(context);

              // print(_datain[i].PROCESS_ORDER);
              Dio().post(
                serverGB + "PRODUCTIONHISTORY/FREEQUERY",
                data: {
                  "query":
                      "SELECT TOP (1000) [date],[station],[weig],[code] FROM [SOI8LOG].[dbo].[kubotalog] where code like '%${_data_exp[i].BATCH.replaceAll(" ", " ")}%' order by date desc",
                },
              ).then((s) {
                // print(s.data);
                var input = s.data;
                List<reportCSV> data = [];
                for (var i = 0; i < input.length; i++) {
                  data.add(reportCSV(
                    F01: input[i]['date'] != null
                        ? input[i]['date'].toString()
                        : "",
                    F02: input[i]['station'] != null
                        ? input[i]['station'].toString()
                        : "",
                    F03: input[i]['weig'] != null
                        ? (double.parse(
                                    ConverstStr(input[i]['weig'].toString())) /
                                100)
                            .toString()
                        : "",
                    F04: input[i]['code'] != null
                        ? input[i]['code'].toString()
                        : "",
                  ));
                }
                ExpCSV2(data, _data_exp[i].BATCH);
              });
            },
            onHover: (v) {
              //
              // print(v.toString() + ":" + i.toString());
              setState(() {
                P224PRODUCTIONCONFIRMATIONSMYEVAR.holding = i;
              });
            },
            child: PRODUCTIONCONFIRMATIONYEitem(
              holding: P224PRODUCTIONCONFIRMATIONSMYEVAR.holding == i,
              text01: _data_exp[i].PROCESS_ORDER,
              text02: _data_exp[i].MATERIAL,
              text03: _data_exp[i].MATERIAL_TEXT,
              text04: _data_exp[i].PROD_SUP_DESC,
              text05: _data_exp[i].PROD_SUP,
              text06: _data_exp[i].BATCH,
              // text07: (_data_exp[i].Yield != '')
              //     ? (_data_exp[i].Yield + ' ' + _data_exp[i].UOM)
              //     : '',
              text07: _data_exp[i].Y1 + ' : ' + _data_exp[i].Y2 + '',
              text08: _data_exp[i].Yield,
              text09: _data_exp[i].STATUS,
              text10: _data_exp[i].SYSTEM_STATUS.contains("DLV")
                  ? "SM COMPLETE"
                  : "WAIT QC or QA",
              // text09: _data_exp[i].SYSTEM_STATUS,
              //SYSTEM_STATUS
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
                      child: InkWell(
                        onTap: () {
                          DateTime calendaset = DateTime.now();
                          //
                          CalendaSelectDates(context, calendaset,
                              (day, month, year) {
                            //
                            P224PRODUCTIONCONFIRMATIONSMYEVAR.day = day;
                            P224PRODUCTIONCONFIRMATIONSMYEVAR.month = month;
                            P224PRODUCTIONCONFIRMATIONSMYEVAR.year = year;

                            P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next = day;
                            P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next =
                                month;
                            P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next = year;

                            setState(() {});
                            context
                                .read<P224PRODUCTIONCONFIRMATIONSMYEget_Bloc>()
                                .add(P224PRODUCTIONCONFIRMATIONSMYEget_GET());
                          });
                        },
                        child: Text(
                          "PRODUCTION CONFIRMATION SM TABLE",
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
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.day = day;
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.month = month;
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.year = year;

                        setState(() {});
                        context
                            .read<P224PRODUCTIONCONFIRMATIONSMYEget_Bloc>()
                            .add(P224PRODUCTIONCONFIRMATIONSMYEget_GET());
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
                          "วันที่ : ${P224PRODUCTIONCONFIRMATIONSMYEVAR.day}-${P224PRODUCTIONCONFIRMATIONSMYEVAR.month}-${P224PRODUCTIONCONFIRMATIONSMYEVAR.year}",
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
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next = day;
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next = month;
                        P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P224PRODUCTIONCONFIRMATIONSMYEget_Bloc>()
                            .add(P224PRODUCTIONCONFIRMATIONSMYEget_GET());
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
                          "ถึงวันที่ : ${P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next}-${P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next}-${P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next}",
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
                          isContr: P224PRODUCTIONCONFIRMATIONSMYEVAR.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              P224PRODUCTIONCONFIRMATIONSMYEVAR.iscontrol =
                                  input;
                            });
                          },
                          sPlaceholder: "search",
                          sValue: P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH,
                          returnfunc: (String s) {
                            setState(() {
                              P224PRODUCTIONCONFIRMATIONSMYEVAR.SEARCH = s;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  PRODUCTIONCONFIRMATIONYEtable(),
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
//         create: (_) => P224PRODUCTIONCONFIRMATIONSMYEgetsub_Bloc(),
//         child: BlocBuilder<P224PRODUCTIONCONFIRMATIONSMYEgetsub_Bloc,
//             List<P224PRODUCTIONCONFIRMATIONSMYEgetsubclass>>(
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
//   List<P224PRODUCTIONCONFIRMATIONSMYEgetsubclass>? data;

//   @override
//   State<_DATAGETSET> createState() => __DATAGETSETState();
// }

// class __DATAGETSETState extends State<_DATAGETSET> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context
//         .read<P224PRODUCTIONCONFIRMATIONSMYEgetsub_Bloc>()
//         .add(P224PRODUCTIONCONFIRMATIONSMYEgetsub_GET());
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<P224PRODUCTIONCONFIRMATIONSMYEgetsubclass> _data = widget.data ?? [];
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

// //P224PRODUCTIONCONFIRMATIONSMYEgetsubclass

ExpCSV2(List<reportCSV> data, String sin) {
  List<List<dynamic>> rows = [];

  for (int i = -1; i < data.length; i++) {
    List<dynamic> row = [];
    if (i == -1) {
      row.add('date');
      row.add('station');
      row.add('weig');
      row.add('code');

      //F73
    } else {
      row.add(data[i].F01);
      row.add(data[i].F02);
      row.add(data[i].F03);
      row.add(data[i].F04);
    }

    rows.add(row);
  }
  // String datetada = "${selectedDate.toLocal()}".split(' ')[0];
  String csv = const ListToCsvConverter().convert(rows);
  AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", "${sin}.csv")
    ..click();
}
