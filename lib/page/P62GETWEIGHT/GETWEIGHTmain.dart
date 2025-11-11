import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html';

import '../../bloc/BlocEvent/20-1-registerpo.dart';
import '../../bloc/BlocEvent/20-2-checkregis.dart';
import '../../data/global.dart';
import '../../model/model.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Safty.dart';

import '../../widget/common/popup.dart';
import 'GETWEIGHTvar.dart';

final GlobalKey _globalKey = GlobalKey();

class GETWEIGHT extends StatefulWidget {
  GETWEIGHT({
    Key? key,
    this.data,
    this.Listdata,
  }) : super(key: key);
  int? data;
  List<checkregisc>? Listdata;

  @override
  State<GETWEIGHT> createState() => _GETWEIGHTState();
}

class _GETWEIGHTState extends State<GETWEIGHT> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GETWEIGHTvar.ischeck = false;
    GETWEIGHTvar.POINPUT = '';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == 2) {
      GETWEIGHTvar.isPOINPUT = true;
      setState(() {
        GETWEIGHTvar.POINPUT = '';
      });
    }
    List<checkregisc> _Listdata = widget.Listdata ?? [];
    GETWEIGHTvar.canregis = 0;

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
                            height: 40,
                            width: 350,
                            isEnabled: !GETWEIGHTvar.ischeck,
                            isContr: GETWEIGHTvar.isPOINPUT,
                            fnContr: (input) {
                              setState(() {
                                GETWEIGHTvar.isPOINPUT = input;
                              });
                            },
                            sValue: GETWEIGHTvar.POINPUT,
                            returnfunc: (String s) {
                              GETWEIGHTvar.POINPUT = s;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                //
                                Dio().post(
                                  serverGB + "PRODUCTIONHISTORY/FREEQUERY",
                                  data: {
                                    "query":
                                        "SELECT TOP (1000) [date],[station],[weig],[code] FROM [SOI8LOG].[dbo].[kubotalog] where code = '${GETWEIGHTvar.POINPUT.replaceAll(" ", " ")}' order by date desc",
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
                                          ? (double.parse(ConverstStr(input[i]
                                                          ['weig']
                                                      .toString())) /
                                                  100)
                                              .toString()
                                          : "",
                                      F04: input[i]['code'] != null
                                          ? input[i]['code'].toString()
                                          : "",
                                    ));
                                  }
                                  ExpCSV2(data);
                                });
                                //
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
                                    "Get Weight",
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
                              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
//ConverstStr

ExpCSV2(List<reportCSV> data) {
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
    ..setAttribute("download", "${GETWEIGHTvar.POINPUT}.csv")
    ..click();
}
