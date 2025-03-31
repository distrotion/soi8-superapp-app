// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P231-01-P221FINISHEDGOODTRANFERget.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';

import '../../widget/common/CheckboxC.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../../widget/newtable/FINISHEDGOODTRANFERtable.dart';
import '../page1.dart';

import 'P231FINISHEDGOODTRANFERVAR.dart';

late BuildContext P231FINISHEDGOODTRANFERcontext;

class P231FINISHEDGOODTRANFER extends StatefulWidget {
  P231FINISHEDGOODTRANFER({
    super.key,
    this.data,
  });
  List<P231FINISHEDGOODTRANFERgetclass>? data;

  @override
  State<P231FINISHEDGOODTRANFER> createState() =>
      _P231FINISHEDGOODTRANFERState();
}

class _P231FINISHEDGOODTRANFERState extends State<P231FINISHEDGOODTRANFER> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P231FINISHEDGOODTRANFERVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P231FINISHEDGOODTRANFERVAR.day = DateFormat('dd').format(now);
    P231FINISHEDGOODTRANFERVAR.month = DateFormat('MM').format(now);
    P231FINISHEDGOODTRANFERVAR.year = DateFormat('yyyy').format(now);

    P231FINISHEDGOODTRANFERVAR.day_next = DateFormat('dd').format(now);
    P231FINISHEDGOODTRANFERVAR.month_next = DateFormat('MM').format(now);
    P231FINISHEDGOODTRANFERVAR.year_next = DateFormat('yyyy').format(now);

    // P231FINISHEDGOODTRANFERVAR.day = "03";
    // P231FINISHEDGOODTRANFERVAR.month = "03";
    // P231FINISHEDGOODTRANFERVAR.year = "2025";
    // P231FINISHEDGOODTRANFERVAR.day_next = "05";
    // P231FINISHEDGOODTRANFERVAR.month_next = "04";
    // P231FINISHEDGOODTRANFERVAR.year_next = "2025";

    P231FINISHEDGOODTRANFERVAR.iscontrol = true;
    P231FINISHEDGOODTRANFERVAR.SEARCH = '';
    P231FINISHEDGOODTRANFERVAR.holding = 999;
    context
        .read<P231FINISHEDGOODTRANFERget_Bloc>()
        .add(P231FINISHEDGOODTRANFERget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P231FINISHEDGOODTRANFERcontext = context;
    List<P231FINISHEDGOODTRANFERgetclass> _datain = widget.data ?? [];
    List<P231FINISHEDGOODTRANFERgetclass> _datasearch = [];

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
                        P231FINISHEDGOODTRANFERVAR.day = day;
                        P231FINISHEDGOODTRANFERVAR.month = month;
                        P231FINISHEDGOODTRANFERVAR.year = year;

                        setState(() {});
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
                          "วันที่ : ${P231FINISHEDGOODTRANFERVAR.day}-${P231FINISHEDGOODTRANFERVAR.month}-${P231FINISHEDGOODTRANFERVAR.year}",
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
                        P231FINISHEDGOODTRANFERVAR.day_next = day;
                        P231FINISHEDGOODTRANFERVAR.month_next = month;
                        P231FINISHEDGOODTRANFERVAR.year_next = year;

                        setState(() {});
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
                          "ถึงวันที่ : ${P231FINISHEDGOODTRANFERVAR.day_next}-${P231FINISHEDGOODTRANFERVAR.month_next}-${P231FINISHEDGOODTRANFERVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  FINISHEDGOODTRANFERtable(),
                  // if (_datasearch
                  //     .any((item) => item.PLANT == 'noxrust'))
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0; i < _datain.length; i++) ...[
                              // for (int i = 0; i < 10; i++) ...[
                              InkWell(
                                onTap: () {
                                  //
                                  // P231FINISHEDGOODTRANFERVAR
                                  //         .PROCESS_ORDERselect =
                                  //     _datain[i].PROCESS_ORDER;
                                  //-----------------------------------------------
                                  P231FINISHEDGOODTRANFERVAR
                                      .FINALSEND = (double.parse(ConverstStr(
                                                  _datain[i].NumPackSize1)) *
                                              double.parse(ConverstStr(
                                                  _datain[i].NumQuantity1)) +
                                          double.parse(ConverstStr(_datain[i].NumPackSize2)) *
                                              double.parse(ConverstStr(
                                                  _datain[i].NumQuantity2)) +
                                          double.parse(ConverstStr(
                                                  _datain[i].NumPackSize3)) *
                                              double.parse(
                                                  ConverstStr(_datain[i].NumQuantity3)))
                                      .toString();
                                  P231FINISHEDGOODTRANFERVAR.UNIT =
                                      _datain[i].UOM;
                                  P231FINISHEDGOODTRANFERVAR.FGPOSTDATA =
                                      _datain[i];
                                  _POPUPCREATEUSERSW(context);
                                  P231FINISHEDGOODTRANFERVAR.Page = 0;
                                  //-------------
                                  // setState(() {
                                  //   if (_datain[i].check) {
                                  //     _datain[i].check = false;
                                  //   } else {
                                  //     _datain[i].check = true;
                                  //   }
                                  // });
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P231FINISHEDGOODTRANFERVAR.holding = i;
                                  });
                                },
                                child: FINISHEDGOODTRANFERitem(
                                  Wid01: CheckBoxC(
                                    getChbox: (p0) {
                                      setState(() {
                                        _datain[i].check = p0;
                                      });
                                    },
                                    value: _datain[i].check,
                                  ),
                                  holding:
                                      P231FINISHEDGOODTRANFERVAR.holding == i,
                                  text01: _datain[i].PROCESS_ORDER,
                                  text02: _datain[i].MATERIAL,
                                  text03: _datain[i].MATERIAL_TEXT,
                                  text04: _datain[i].PROD_SUP_DESC,
                                  text05: _datain[i].BATCH,
                                  text06: _datain[i].Yield,
                                  text07: _datain[i].NumPackSize1 != ''
                                      ? '(P${_datain[i].NumPackSize1})*${_datain[i].NumQuantity1}'
                                      : "",
                                  text08: _datain[i].NumPackSize2 != ''
                                      ? '(P${_datain[i].NumPackSize2})*${_datain[i].NumQuantity2}'
                                      : "",
                                  text09: _datain[i].NumPackSize3 != ''
                                      ? '(P${_datain[i].NumPackSize3})*${_datain[i].NumQuantity3}'
                                      : "",
                                  text10: "-",
                                  text11: "-",
                                  text12: "-",
                                ),
                              ),
                            ],
                          ],
                        ),
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
        child: Container(
          height: 300,
          width: 800,
          color: Colors.white,
          child: Material(child: _DATAGETSET()),
        ),
      );
    },
  );
}

// class _DATAGETSETbloc extends StatelessWidget {
//   const _DATAGETSETbloc({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => P231FINISHEDGOODTRANFERgetsub_Bloc(),
//         child: BlocBuilder<P231FINISHEDGOODTRANFERgetsub_Bloc,
//             List<P231FINISHEDGOODTRANFERgetsubclass>>(
//           builder: (context, data) {
//             return _DATAGETSET(
//               data: data,
//             );
//           },
//         ));
//   }
// }

class _DATAGETSET extends StatefulWidget {
  _DATAGETSET({
    super.key,
  });

  @override
  State<_DATAGETSET> createState() => __DATAGETSETState();
}

class __DATAGETSETState extends State<_DATAGETSET> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          if (P231FINISHEDGOODTRANFERVAR.Page == 0) ...[
            // if (_datasearch
            //     .any((item) => item.PLANT == 'noxrust'))
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: Text("DATA TO STORE"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("TO STORE"),
                  ),
                  ComInputText(
                    height: 40,
                    width: 200,
                    isContr: P231FINISHEDGOODTRANFERVAR.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        P231FINISHEDGOODTRANFERVAR.iscontrol = input;
                      });
                    },
                    sValue: P231FINISHEDGOODTRANFERVAR.FINALSEND,
                    returnfunc: (String s) {
                      setState(() {
                        P231FINISHEDGOODTRANFERVAR.FINALSEND = s;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(P231FINISHEDGOODTRANFERVAR.UNIT),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: InkWell(
                onTap: () {
                  //
                  DateTime calendaset = DateTime.now();
                  Map<String, String> dataset = {
                    "PSTNG_DATE":
                        // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                        "${P231FINISHEDGOODTRANFERVAR.day_next}.${P231FINISHEDGOODTRANFERVAR.month_next}.${P231FINISHEDGOODTRANFERVAR.year_next}",
                    "DOC_DATE":
                        // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                        "${P231FINISHEDGOODTRANFERVAR.day_next}.${P231FINISHEDGOODTRANFERVAR.month_next}.${P231FINISHEDGOODTRANFERVAR.year_next}",
                    "REF_DOC_NO":
                        P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.PROCESS_ORDER,
                    "HEADER_TXT": "USER DATA",
                    "MATERIAL": P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.MATERIAL,
                    "PLANT": "1000",
                    "STGE_LOC": P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.STGE_LOC,
                    "BATCH": P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.BATCH,
                    "MOVE_TYPE": "101",
                    "STCK_TYPE": "",
                    "ENTRY_QNT": P231FINISHEDGOODTRANFERVAR.FINALSEND,
                    "ENTRY_UOM": P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.UOM,
                    "ORDERID":
                        P231FINISHEDGOODTRANFERVAR.FGPOSTDATA.PROCESS_ORDER,
                    "EXPIRYDATE": "",
                    "PROD_DATE":
                        // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                        "${P231FINISHEDGOODTRANFERVAR.day_next}.${P231FINISHEDGOODTRANFERVAR.month_next}.${P231FINISHEDGOODTRANFERVAR.year_next}",
                    "TEMPLATE": ""
                  };

                  // print(dataset);

                  FreeLoading(context);
                  Dio()
                      .post(
                    "${server2}03iPPGETDATACHEM/SETI003DATA",
                    data: dataset,
                  )
                      .then((v) {
                    //
                    // Navigator.pop(P231FINISHEDGOODTRANFERcontext);
                    // Navigator.pop(context);
                    Navigator.pop(context);
                    P231FINISHEDGOODTRANFERVAR.Page = 1;
                    setState(() {});
                    print(v.data);
                  });
                },
                child: Container(
                  width: 400,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("POST TO STORE"),
                  ),
                ),
              ),
            ),
          ] else ...[
            // QrImageView(
            //   data: '1234567890',
            //   version: QrVersions.auto,
            //   size: 200.0,
            // ),
            Text("QRCODE REMAIN")
          ]
        ],
      ),
    );
  }
}

// //P231FINISHEDGOODTRANFERgetsubclass