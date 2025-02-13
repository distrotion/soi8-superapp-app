import 'dart:convert';
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/P11BTTANKHISEXPORT/P11BTTANKHISEXPORTmain.dart';
import '../../page/P11BTTANKHISEXPORT/P11BTTANKHISEXPORTvar.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/BTTANKHISitem.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class P11BTTANKHISEXPORT_Event {}

class P11BTTANKHISEXPORT_GET extends P11BTTANKHISEXPORT_Event {}

class P11BTTANKHISEXPORT_GET_BYDATE extends P11BTTANKHISEXPORT_Event {}

class P11BTTANKHISEXPORT_GET_BYDATE_EX extends P11BTTANKHISEXPORT_Event {}

class P11BTTANKHISEXPORT_flush extends P11BTTANKHISEXPORT_Event {}

class P11BTTANKHISEXPORT_Bloc
    extends Bloc<P11BTTANKHISEXPORT_Event, List<BTTANKHISitem>> {
  P11BTTANKHISEXPORT_Bloc() : super([]) {
    on<P11BTTANKHISEXPORT_GET>((event, emit) {
      return _P11BTTANKHISEXPORT_GET([], emit);
    });
    on<P11BTTANKHISEXPORT_GET_BYDATE>((event, emit) {
      return _P11BTTANKHISEXPORT_GET_BYDATE([], emit);
    });
    on<P11BTTANKHISEXPORT_GET_BYDATE_EX>((event, emit) {
      return _P11BTTANKHISEXPORT_GET_BYDATE_EX([], emit);
    });
    on<P11BTTANKHISEXPORT_flush>((event, emit) {
      return _P11BTTANKHISEXPORT_flush([], emit);
    });
  }
  Future<void> _P11BTTANKHISEXPORT_GET(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    FreeLoading(P11BTTANKHISEXPORTmaincontext);
//P11BTTANKHISEXPORTmaincontext
    List<BTTANKHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY6",
      data: {
        "query":
            "SELECT TOP (${P11BTTANKHISEXPORTvar.MAX}) * FROM [Measurement].[dbo].[BT_TANK_DATA] order by [date] desc"
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(BTTANKHISitem(
          text01: StringChecknull(databuff[i]['date']),
          text02: double.parse(ConverstStr(StringChecknull(databuff[i]['BT2'])))
              .toStringAsFixed(4),
          text03: double.parse(ConverstStr(StringChecknull(databuff[i]['BT3'])))
              .toStringAsFixed(4),
          text04: double.parse(ConverstStr(StringChecknull(databuff[i]['BT4'])))
              .toStringAsFixed(4),
          text05: StringChecknull(databuff[i]['RT6']),
          text06: StringChecknull(databuff[i]['RT7']),
          text07: StringChecknull(databuff[i]['RT8']),
          text08: StringChecknull(databuff[i]['RT13']),
          text09: StringChecknull(databuff[i]['RT15']),
          text10: StringChecknull(databuff[i]['RT17']),
        ));
      }
    }
    Navigator.pop(P11BTTANKHISEXPORTmaincontext);
    emit(output);
  }

  Future<void> _P11BTTANKHISEXPORT_GET_BYDATE(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    FreeLoading(P11BTTANKHISEXPORTmaincontext);
//P11BTTANKHISEXPORTmaincontext
    List<BTTANKHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY6",
      data: {
        "query":
            "SELECT * FROM [Measurement].[dbo].[BT_TANK_DATA] WHERE [date] between '${P11SumReportvar.startDATEout.year}-${P11SumReportvar.startDATEout.month}-${P11SumReportvar.startDATEout.day}' and '${P11SumReportvar.endDATEout.year}-${P11SumReportvar.endDATEout.month}-${P11SumReportvar.endDATEout.day}' order by [date] desc"
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(BTTANKHISitem(
          text01: StringChecknull(databuff[i]['date']),
          text02: double.parse(ConverstStr(StringChecknull(databuff[i]['BT2'])))
              .toStringAsFixed(4),
          text03: double.parse(ConverstStr(StringChecknull(databuff[i]['BT3'])))
              .toStringAsFixed(4),
          text04: double.parse(ConverstStr(StringChecknull(databuff[i]['BT4'])))
              .toStringAsFixed(4),
          text05: StringChecknull(databuff[i]['RT6']),
          text06: StringChecknull(databuff[i]['RT7']),
          text07: StringChecknull(databuff[i]['RT8']),
          text08: StringChecknull(databuff[i]['RT13']),
          text09: StringChecknull(databuff[i]['RT15']),
          text10: StringChecknull(databuff[i]['RT17']),
        ));
      }
    }
    Navigator.pop(P11BTTANKHISEXPORTmaincontext);
    emit(output);
  }

  Future<void> _P11BTTANKHISEXPORT_GET_BYDATE_EX(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    FreeLoading(P11BTTANKHISEXPORTmaincontext);
//P11BTTANKHISEXPORTmaincontext
    List<BTTANKHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY6",
      data: {
        "query":
            "SELECT * FROM [Measurement].[dbo].[BT_TANK_DATA] WHERE [date] between '${P11SumReportvar.startDATEout.year}-${P11SumReportvar.startDATEout.month}-${P11SumReportvar.startDATEout.day}' and '${P11SumReportvar.endDATEout.year}-${P11SumReportvar.endDATEout.month}-${P11SumReportvar.endDATEout.day}' order by [date] desc"
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(BTTANKHISitem(
          text01: StringChecknull(databuff[i]['date']),
          text02: double.parse(ConverstStr(StringChecknull(databuff[i]['BT2'])))
              .toStringAsFixed(4),
          text03: double.parse(ConverstStr(StringChecknull(databuff[i]['BT3'])))
              .toStringAsFixed(4),
          text04: double.parse(ConverstStr(StringChecknull(databuff[i]['BT4'])))
              .toStringAsFixed(4),
          text05: StringChecknull(databuff[i]['RT6']),
          text06: StringChecknull(databuff[i]['RT7']),
          text07: StringChecknull(databuff[i]['RT8']),
          text08: StringChecknull(databuff[i]['RT13']),
          text09: StringChecknull(databuff[i]['RT15']),
          text10: StringChecknull(databuff[i]['RT17']),
        ));
      }
    }

    Navigator.pop(P11BTTANKHISEXPORTmaincontext);
    ExpCSV(output);
    emit(output);
  }

  Future<void> _P11BTTANKHISEXPORT_flush(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    List<BTTANKHISitem> output = [];
    emit(output);
  }
}

String _unixTimestampTOStringDateTime(int unixTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

  // Format DateTime as a string
  String formattedDate = DateFormat('dd-MM-yyy').format(dateTime);

  return formattedDate;
}

String _unixTimestampTOStringDateTimeT(int unixTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

  // Format DateTime as a string
  String formattedDate = DateFormat('kk:mm').format(dateTime);

  return formattedDate;
}

ExpCSV(List<BTTANKHISitem> data) {
  List<List<dynamic>> rows = [];

  for (int i = -1; i < data.length; i++) {
    List<dynamic> row = [];
    if (i == -1) {
      row.add('date');
      row.add('BT2');
      row.add('BT3');
      row.add('BT4');

      row.add('RT6');
      row.add('RT7');
      row.add('RT8');
      row.add('RT13');
      row.add('RT15');
      row.add('RT17');

      //F73
    } else {
      row.add(data[i].text01);
      row.add(data[i].text02);
      row.add(data[i].text03);
      row.add(data[i].text04);
      row.add(data[i].text05);
      row.add(data[i].text06);
      row.add(data[i].text07);
      row.add(data[i].text08);
      row.add(data[i].text09);
      row.add(data[i].text10);
    }

    rows.add(row);
  }
  String datetada =
      "${P11SumReportvar.startDATEout.year}-${P11SumReportvar.startDATEout.month}-${P11SumReportvar.startDATEout.day}to${P11SumReportvar.endDATEout.year}-${P11SumReportvar.endDATEout.month}-${P11SumReportvar.endDATEout.day}"
          .split(' ')[0];
  String csv = const ListToCsvConverter().convert(rows);
  AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", "test ${datetada}.csv")
    ..click();
}
