// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/BlocEvent/P211-01-P211CHEMPLANINGget.dart';

import '../../bloc/BlocEvent/P211-02-P211CHEMPLANINGgetsub.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/PLANINGSUBtable.dart';
import '../../widget/newtable/PLANINGtable.dart';
import '../../widget/newtable/QMMAASTERtable.dart';

import 'P211CHEMPLANINGVAR.dart';

late BuildContext P211CHEMPLANINGcontext;

class P211CHEMPLANING extends StatefulWidget {
  P211CHEMPLANING({
    super.key,
    this.data,
  });
  List<P211CHEMPLANINGgetclass>? data;

  @override
  State<P211CHEMPLANING> createState() => _P211CHEMPLANINGState();
}

class _P211CHEMPLANINGState extends State<P211CHEMPLANING> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P211CHEMPLANINGVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P211CHEMPLANINGVAR.day = DateFormat('dd').format(now);
    P211CHEMPLANINGVAR.month = DateFormat('MM').format(now);
    P211CHEMPLANINGVAR.year = DateFormat('yyyy').format(now);

    // P211CHEMPLANINGVAR.day_next = DateFormat('dd').format(now);
    // P211CHEMPLANINGVAR.month_next = DateFormat('MM').format(now);
    // P211CHEMPLANINGVAR.year_next = DateFormat('yyyy').format(now);

    P211CHEMPLANINGVAR.day_next = "05";
    P211CHEMPLANINGVAR.month_next = "04";
    P211CHEMPLANINGVAR.year_next = "2025";

    P211CHEMPLANINGVAR.iscontrol = true;
    P211CHEMPLANINGVAR.SEARCH = '';
    P211CHEMPLANINGVAR.holding = 999;
    context.read<P211CHEMPLANINGget_Bloc>().add(P211CHEMPLANINGget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P211CHEMPLANINGcontext = context;
    List<P211CHEMPLANINGgetclass> _datain = widget.data ?? [];
    List<P211CHEMPLANINGgetclass> _datasearch = [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        "Incoming Table",
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
                        P211CHEMPLANINGVAR.day = day;
                        P211CHEMPLANINGVAR.month = month;
                        P211CHEMPLANINGVAR.year = year;

                        setState(() {});
                        context
                            .read<P211CHEMPLANINGget_Bloc>()
                            .add(P211CHEMPLANINGget_GET());
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
                          "วันที่ : ${P211CHEMPLANINGVAR.day}-${P211CHEMPLANINGVAR.month}-${P211CHEMPLANINGVAR.year}",
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
                        P211CHEMPLANINGVAR.day_next = day;
                        P211CHEMPLANINGVAR.month_next = month;
                        P211CHEMPLANINGVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P211CHEMPLANINGget_Bloc>()
                            .add(P211CHEMPLANINGget_GET());
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
                          "ถึงวันที่ : ${P211CHEMPLANINGVAR.day_next}-${P211CHEMPLANINGVAR.month_next}-${P211CHEMPLANINGVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  PLANINGtable(),
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
                                  P211CHEMPLANINGVAR.PROCESS_ORDERselect =
                                      _datain[i].PROCESS_ORDER;
                                  _POPUPCREATEUSERSW(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P211CHEMPLANINGVAR.holding = i;
                                  });
                                },
                                child: PLANINGitem(
                                  holding: P211CHEMPLANINGVAR.holding == i,
                                  text01: _datain[i].PROCESS_ORDER,
                                  text02: _datain[i].MATERIAL,
                                  text03: _datain[i].MATERIAL_TEXT,
                                  text04: _datain[i].PROD_SUP_DESC,
                                  text05: _datain[i].PROD_SUP,
                                  text06: _datain[i].BATCH,
                                  text07:
                                      '${_datain[i].TOTAL_QTY} ${_datain[i].UOM}',
                                  text08: _datain[i].STATUS,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 800,
              color: Colors.white,
              // child: Page43(),
              child: _DATAGETSETbloc(),
            ),
          ),
        ),
      );
    },
  );
}

class _DATAGETSETbloc extends StatelessWidget {
  const _DATAGETSETbloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P211CHEMPLANINGgetsub_Bloc(),
        child: BlocBuilder<P211CHEMPLANINGgetsub_Bloc,
            List<P211CHEMPLANINGgetsubclass>>(
          builder: (context, data) {
            return _DATAGETSET(
              data: data,
            );
          },
        ));
  }
}

class _DATAGETSET extends StatefulWidget {
  _DATAGETSET({
    super.key,
    this.data,
  });
  List<P211CHEMPLANINGgetsubclass>? data;

  @override
  State<_DATAGETSET> createState() => __DATAGETSETState();
}

class __DATAGETSETState extends State<_DATAGETSET> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P211CHEMPLANINGgetsub_Bloc>().add(P211CHEMPLANINGgetsub_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P211CHEMPLANINGgetsubclass> _data = widget.data ?? [];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Center(
                child: Text("SAP RECOMMENDATION"),
              ),
            ),
          ),

          PLANINGSUBtable(),
          // if (_datasearch
          //     .any((item) => item.PLANT == 'noxrust'))
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Container(
                // width: 1100,
                child: Column(
                  children: [
                    for (int i = 0; i < _data.length; i++) ...[
                      // for (int i = 0; i < 10; i++) ...[
                      PLANINGSUBitem(
                        text01: _data[i].ITEM,
                        text02: _data[i].MATERIAL,
                        text03: _data[i].MATERIAL_TEXT,
                        text04: _data[i].REQ_QTY + ' ' + _data[i].UOM,
                        text05: _data[i].BATCH_QTY + ' ' + _data[i].BATCH_UOM,
                        text06: _data[i].BATCH,
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        width: 200,
                        color: Colors.blue,
                        child: Center(
                          child: Text("Weight Record"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//P211CHEMPLANINGgetsubclass