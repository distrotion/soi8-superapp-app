// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/P221-01-P221PRODUCTIONCONFIRMATIONSMget.dart';
import '../../bloc/BlocEvent/P310-01-P26PROGRESSGETDATA.dart';

import '../../bloc/BlocEvent/P310-02-P26TANKDATAPACKING.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Error_NO_Popup.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../P221PRODUCTIONCONFIRMATIONSM/P221PRODUCTIONCONFIRMATIONSM.dart';
import '../P221PRODUCTIONCONFIRMATIONSM/P221PRODUCTIONCONFIRMATIONSMVAR.dart';

import '../P60PRCESSMANUAL/P60PRCESSMANUALVAR.dart';
import '../page60.dart';
import 'P310CHEMTANKVAR.dart';

late BuildContext P310CHEMTANKMAINcontext;

class P310CHEMTANKMAIN extends StatefulWidget {
  P310CHEMTANKMAIN({
    super.key,
    this.data,
    this.wg,
  });
  List<P310CHEMTANKGETDATAclass>? data;
  P26TANKDATAPACKINGclass? wg;

  @override
  State<P310CHEMTANKMAIN> createState() => _P310CHEMTANKMAINState();
}

class _P310CHEMTANKMAINState extends State<P310CHEMTANKMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<P310CHEMTANKGETDATA_Bloc>().add(P310CHEMTANKGETDATA_GET());
    // Timer(Duration(seconds: 1), () {
    //   context.read<P26TANKDATAPACKING_Bloc>().add(P26TANKDATAPACKING_GET());
    // });

    P310CHEMTANKVAR.iscontrol = true;
    P310CHEMTANKVAR.SEARCH = '';
  }

  @override
  Widget build(BuildContext context) {
    P310CHEMTANKMAINcontext = context;
    List<P310CHEMTANKGETDATAclass> _datain =
        widget.data?.reversed.toList() ?? [];

    P26TANKDATAPACKINGclass _wg = widget.wg ?? P26TANKDATAPACKINGclass();

    final ids = Set();
    _datain.retainWhere((x) =>
        ids.add(x.CHEMICALNAME) |
        ids.add(x.BARCODE) |
        ids.add(x.SP) |
        ids.add(x.ACTUAL));

    List<P310CHEMTANKGETDATAclass> _datasearch = [];
    _datasearch.addAll(
      _datain.where(
        (data) =>
            data.CHEMICALNAME.toLowerCase().contains(P310CHEMTANKVAR.SEARCH) ||
            data.BARCODE.toLowerCase().contains(P310CHEMTANKVAR.SEARCH) ||
            data.SP.toLowerCase().contains(P310CHEMTANKVAR.SEARCH) ||
            data.ACTUAL.toLowerCase().contains(P310CHEMTANKVAR.SEARCH),
      ),
    );

    double totalActual =
        _datasearch.fold(0.0, (sum, item) => sum + double.parse(item.ACTUAL));
    double totalSP =
        _datasearch.fold(0.0, (sum, item) => sum + double.parse(item.SP));

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
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
                          // '${USERDATA.PLANTNAME} : ${USERDATA.TANK} : ${USERDATA.ORDER}',
                          "",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        P60PRCESSMANUALVAR.ORDER =
                            P310CHEMTANKVAR.MATERIAL + P310CHEMTANKVAR.ORDER;
                        CuPage = Page60();
                        MainBodyContext.read<ChangePage_Bloc>()
                            .add(ChangePage_nodrower());
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        color: Colors.green,
                        child: Center(
                          child: Text("Manual Data"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FixedColumnWidth(50.0),
                              1: FixedColumnWidth(300),
                              2: FixedColumnWidth(100.0),
                              3: FixedColumnWidth(100.0),
                              4: FixedColumnWidth(100.0),
                              5: FixedColumnWidth(100.0),
                              6: FixedColumnWidth(100.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'NO.',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'CHEMICAL',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'BARCODE',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'SP. (kg)',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'ACTUAL (kg)',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'Recomment LOT',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: 50,
                                            child: Container(
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  'LOT',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ..._datasearch.map(
                                (item) {
                                  int dataCount = _datasearch.indexOf(item) + 1;
                                  return TableRow(
                                    children: [
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text(dataCount.toString()),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:
                                                Text('  ${item.CHEMICALNAME}'),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child:
                                              Center(child: Text(item.BARCODE)),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text(item.SP),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text(item.ACTUAL),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text(item.LOT),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text(item.LOT),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 150,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'TOTAL',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    totalSP.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 100.5,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    right: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    totalActual.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'NO',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'PACKET Size',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'PACKET QTY',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'Total',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '1',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumPackSize1,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),

                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumQuantity1,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     //

                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1))}",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '2',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumPackSize2,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumQuantity2,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "${double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2))}",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '3',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumPackSize3,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           _wg.NumQuantity3,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "${double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       // decoration: BoxDecoration(
                          //       //   color: Colors.green.shade100,
                          //       //   border: Border(
                          //       //     top: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     left: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     bottom: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       child: Center(
                          //         child: Text(
                          //           '',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       // decoration: BoxDecoration(
                          //       //   color: Colors.green.shade100,
                          //       //   border: Border(
                          //       //     top: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     left: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     bottom: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       child: Center(
                          //           // child: Text(
                          //           //   _wg.NumPackSize3,
                          //           //   style: TextStyle(
                          //           //     fontWeight: FontWeight.bold,
                          //           //   ),
                          //           // ),
                          //           ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "TATAL",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       // decoration: BoxDecoration(
                          //       //   color: Colors.green.shade100,
                          //       //   border: Border(
                          //       //     top: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     left: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     bottom: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       child: Center(
                          //         child: Text(
                          //           '',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100,
                          //       // decoration: BoxDecoration(
                          //       //   color: Colors.green.shade100,
                          //       //   border: Border(
                          //       //     top: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     left: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //     bottom: BorderSide(
                          //       //       color: Colors.black,
                          //       //       width: 1.0,
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       child: Center(
                          //           // child: Text(
                          //           //   _wg.NumPackSize3,
                          //           //   style: TextStyle(
                          //           //     fontWeight: FontWeight.bold,
                          //           //   ),
                          //           // ),
                          //           ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "Remain",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 30,
                          //       width: 100.5,
                          //       decoration: BoxDecoration(
                          //         color: Colors.green.shade100,
                          //         border: Border(
                          //           top: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           left: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           right: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //           bottom: BorderSide(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "${(double.parse(ConverstStr(totalActual.toStringAsFixed(1))) - (double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3)))).toStringAsFixed(1)}",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    // P221PRODUCTIONCONFIRMATIONSMVAR.dataFG
                                    // P221PRODUCTIONCONFIRMATIONSMVAR.dataSEMI
                                    // P221PRODUCTIONCONFIRMATIONSMVAR.dataCOMPO

                                    //----------------------------------------------------
                                    //
                                    // List<Map<String, String>> databuff = [];
                                    // for (var i = 0;
                                    //     i < _datasearch.length;
                                    //     i++) {
                                    //   print(_datasearch[i].CHEMICALNAME);
                                    //   databuff.add({
                                    //     "MATERIAL": _datasearch[i].ORDER,
                                    //     "PLANT": "1000",
                                    //     "STGE_LOC": "C404",
                                    //     "BATCH": "250214S1",
                                    //     "MOVE_TYPE": "101",
                                    //     "ENTRY_QNT": "10",
                                    //     "ENTRY_UOM": "KG",
                                    //     "MFG_DATE": "10.03.2025"
                                    //   });
                                    // }

                                    // P221PRODUCTIONCONFIRMATIONSMVAR.dataSEMI

                                    DateTime calendaset = DateTime.now();
                                    //

                                    // List<Map<String, String>> dataout1 = [
                                    //   {
                                    //     "MATERIAL":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.MATERIAL,
                                    //     "PLANT": "1000",
                                    //     "STGE_LOC":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.STGE_LOC,
                                    //     "BATCH": P221PRODUCTIONCONFIRMATIONSMVAR
                                    //         .datasetsend.BATCH,
                                    //     "MOVE_TYPE": "101",
                                    //     "ENTRY_QNT":
                                    //         "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                                    //     "ENTRY_UOM":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.UOM,
                                    //     "MFG_DATE":
                                    //         "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                    //   }
                                    // ];
                                    // List<Map<String, String>> dataout2 = [];
                                    // for (var i = 0; i < _datain.length; i++) {
                                    //   //
                                    //   dataout2.add({
                                    //     "MATERIAL":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.MATERIAL,
                                    //     "PLANT": "1000",
                                    //     "STGE_LOC":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.STGE_LOC,
                                    //     "BATCH": P221PRODUCTIONCONFIRMATIONSMVAR
                                    //         .datasetsend.BATCH,
                                    //     "MOVE_TYPE": "101",
                                    //     "ENTRY_QNT":
                                    //         "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                                    //     "ENTRY_UOM":
                                    //         P221PRODUCTIONCONFIRMATIONSMVAR
                                    //             .datasetsend.UOM,
                                    //     "MFG_DATE":
                                    //         "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                    //   });
                                    // }

                                    // print(dataout1);

                                    // Dio().post(
                                    //   "${server2}03iPPGETDATACHEM/SETI005DATA",
                                    //   data: {
                                    //     "TIMECONF": {
                                    //       "ORDERID":
                                    //           P221PRODUCTIONCONFIRMATIONSMVAR
                                    //               .datasetsend.LINK_PROC_ORDER,
                                    //       "PHASE": "0020",
                                    //       "YIELD":
                                    //           "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                                    //       "CONF_QUAN_UNIT":
                                    //           P221PRODUCTIONCONFIRMATIONSMVAR
                                    //               .datasetsend.UOM,
                                    //       "POSTG_DATE":
                                    //           "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                    //       "EXEC_START_DATE":
                                    //           "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                    //     },
                                    //     "T_GOODSMOVEMENT": dataout1,
                                    //   },
                                    // ).then((v) {
                                    //   //
                                    //   print(v.data);
                                    // });

                                    // print(P221PRODUCTIONCONFIRMATIONSMVAR
                                    //     .datasetsend.PROCESS_ORDER);
                                    // print(P221PRODUCTIONCONFIRMATIONSMVAR
                                    //     .datasetsend.LINK_PROC_ORDER);

                                    P221PRODUCTIONCONFIRMATIONSMgetclass
                                        ordersemi =
                                        P221PRODUCTIONCONFIRMATIONSMgetclass();

                                    P221PRODUCTIONCONFIRMATIONSMgetclass
                                        orderfg =
                                        P221PRODUCTIONCONFIRMATIONSMgetclass();

                                    for (var i = 0;
                                        i <
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataSEMI.length;
                                        i++) {
                                      if (P221PRODUCTIONCONFIRMATIONSMVAR
                                              .datasetsend.LINK_PROC_ORDER ==
                                          P221PRODUCTIONCONFIRMATIONSMVAR
                                              .dataSEMI[i].PROCESS_ORDER) {
                                        ordersemi =
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataSEMI[i];
                                      }
                                    }

                                    for (var i = 0;
                                        i <
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataFG.length;
                                        i++) {
                                      if (P221PRODUCTIONCONFIRMATIONSMVAR
                                              .datasetsend.PROCESS_ORDER ==
                                          P221PRODUCTIONCONFIRMATIONSMVAR
                                              .dataFG[i].PROCESS_ORDER) {
                                        orderfg =
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataFG[i];
                                      }
                                    }

                                    List<P221GETDETAILclass> dataCOMPOdata = [];

                                    for (var i = 0;
                                        i <
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataCOMPO.length;
                                        i++) {
                                      if (orderfg.PROCESS_ORDER ==
                                          P221PRODUCTIONCONFIRMATIONSMVAR
                                              .dataCOMPO[i].PROCESS_ORDER) {
                                        // print(P221PRODUCTIONCONFIRMATIONSMVAR
                                        //     .dataCOMPO[i].MATERIAL);

                                        dataCOMPOdata.add(
                                            P221PRODUCTIONCONFIRMATIONSMVAR
                                                .dataCOMPO[i]);
                                      }
                                    }

                                    List<Map<String, String>> dataout1 = [
                                      {
                                        "MATERIAL": ordersemi.MATERIAL,
                                        "PLANT": "1000",
                                        "STGE_LOC": ordersemi.STGE_LOC,
                                        "BATCH": ordersemi.BATCH,
                                        "MOVE_TYPE": "101",
                                        // "ENTRY_QNT": orderfg.Yield,
                                        "ENTRY_QNT": totalActual.toString(),
                                        "ENTRY_UOM": ordersemi.UOM,
                                        "MFG_DATE":
                                            // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                            "${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                                      }
                                    ];

                                    List<Map<String, String>> dataout2 = [];
                                    for (var i = 0;
                                        i < dataCOMPOdata.length;
                                        i++) {
                                      //

                                      if (dataCOMPOdata[i]
                                              .MATERIAL
                                              .substring(0, 2) ==
                                          '12') {
                                        print(dataCOMPOdata[i].MATERIAL);
                                        dataout2.add({
                                          "MATERIAL": dataCOMPOdata[i].MATERIAL,
                                          "PLANT": "1000",
                                          "STGE_LOC": dataCOMPOdata[i].STGE_LOC,
                                          "BATCH": "",
                                          "MOVE_TYPE":
                                              dataCOMPOdata[i].MVT_TYPE,
                                          // "ENTRY_QNT": orderfg.Yield,
                                          "ENTRY_QNT": totalActual.toString(),
                                          // "ENTRY_QNT":
                                          //     "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                                          "ENTRY_UOM": dataCOMPOdata[i].UOM,
                                          "MFG_DATE": ""
                                        });
                                      }
                                    }
                                    FreeLoading(context);
                                    Dio().post(
                                      "${server2}03iPPGETDATACHEM/SETI005DATA",
                                      data: {
                                        "TIMECONF": {
                                          "ORDERID": ordersemi.PROCESS_ORDER,
                                          "PHASE": "0020",
                                          // "YIELD": orderfg.Yield,
                                          "YIELD": totalActual.toString(),
                                          "CONF_QUAN_UNIT": ordersemi.UOM,
                                          // "POSTG_DATE":
                                          //     "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                          // "EXEC_START_DATE":
                                          //     "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                          "POSTG_DATE":
                                              "${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                                          "EXEC_START_DATE":
                                              "${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                                        },
                                        "T_GOODSMOVEMENT": dataout1,
                                      },
                                    ).then((v) {
                                      //
                                      print(v.data);

                                      // Timer(Duration(seconds: 4), () {
                                      //   Dio().post(
                                      //     "${server2}03iPPGETDATACHEM/SETI005DATA",
                                      //     data: {
                                      //       "TIMECONF": {
                                      //         "ORDERID": orderfg.PROCESS_ORDER,
                                      //         "PHASE": "0020",
                                      //         // "YIELD": orderfg.Yield,
                                      //         "YIELD":
                                      //             "${double.parse(ConverstStr(_wg.NumQuantity1)) * double.parse(ConverstStr(_wg.NumPackSize1)) + double.parse(ConverstStr(_wg.NumQuantity2)) * double.parse(ConverstStr(_wg.NumPackSize2)) + double.parse(ConverstStr(_wg.NumQuantity3)) * double.parse(ConverstStr(_wg.NumPackSize3))}",
                                      //         "CONF_QUAN_UNIT": orderfg.UOM,
                                      //         // "POSTG_DATE":
                                      //         //     "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                      //         // "EXEC_START_DATE":
                                      //         //     "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                                      //         "POSTG_DATE":
                                      //             "${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                                      //         "EXEC_START_DATE":
                                      //             "${P221PRODUCTIONCONFIRMATIONSMVAR.day_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.month_next}.${P221PRODUCTIONCONFIRMATIONSMVAR.year_next}",
                                      //       },
                                      //       "T_GOODSMOVEMENT": dataout2,
                                      //     },
                                      //   ).then((v) {
                                      //     //
                                      //     print(v.data);
                                      //   });
                                      Navigator.pop(context);
                                      Navigator.pop(
                                          P221PRODUCTIONCONFIRMATIONSMcontext);

                                      if (v.data.length > 0) {
                                        if (v.data[0]['TYPE'] != null) {
                                          if (v.data[0]['TYPE'].toString() ==
                                              'E') {
                                            showErrorPopup(
                                                P221PRODUCTIONCONFIRMATIONSMcontext,
                                                v.data.toString());
                                          } else {
                                            showGoodPopup(
                                                P221PRODUCTIONCONFIRMATIONSMcontext,
                                                v.data.toString());
                                          }
                                        }
                                      }
                                      // });
                                    });
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 100,
                                    color: Colors.green,
                                    child: Center(
                                      child: Text("CONFIRM"),
                                    ),
                                  ),
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     _POPUPCREATEUSERSW(context);
                              //   },
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Container(
                              //       height: 80,
                              //       width: 100,
                              //       color: Colors.red,
                              //       child: Center(
                              //         child: Text("ADJUST"),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
              height: 300,
              width: 500,
              color: Colors.white,
              child: BOTTLEDATA(),
            ),
          ),
        ),
      );
    },
  );
}

class BOTTLEDATA extends StatelessWidget {
  const BOTTLEDATA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'NO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PACKET Size',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PACKET QTY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //

              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                // decoration: BoxDecoration(
                //   color: Colors.green.shade100,
                //   border: Border(
                //     top: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     left: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     bottom: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //   ),
                // ),
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                // decoration: BoxDecoration(
                //   color: Colors.green.shade100,
                //   border: Border(
                //     top: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     left: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     bottom: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //   ),
                // ),
                child: Center(
                    // child: Text(
                    //   _wg.NumPackSize3,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "TATAL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                // decoration: BoxDecoration(
                //   color: Colors.green.shade100,
                //   border: Border(
                //     top: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     left: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     bottom: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //   ),
                // ),
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                // decoration: BoxDecoration(
                //   color: Colors.green.shade100,
                //   border: Border(
                //     top: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     left: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //     bottom: BorderSide(
                //       color: Colors.black,
                //       width: 1.0,
                //     ),
                //   ),
                // ),
                child: Center(
                    // child: Text(
                    //   _wg.NumPackSize3,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Remain",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 150,
              color: Colors.yellow,
              child: Center(
                child: Text("adjust confirm"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _POPUPTEXT(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: textpop(),
            ),
          ),
        ),
      );
    },
  );
}

class textpop extends StatelessWidget {
  const textpop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComInputText(
          // sPlaceholder: "Search...",
          // isSideIcon: true,
          height: 40,
          width: 200,
          isContr: P310CHEMTANKVAR.iscontrol,
          fnContr: (input) {
            P310CHEMTANKVAR.iscontrol = input;
          },
          sValue: P310CHEMTANKVAR.DUMMY,
          returnfunc: (String s) {
            P310CHEMTANKVAR.DUMMY = s;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 180,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
