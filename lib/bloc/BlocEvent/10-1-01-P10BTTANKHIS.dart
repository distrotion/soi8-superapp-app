import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../page/P10BTTANKHIS/P10BTTANKHISmain.dart';
import '../../page/P10BTTANKHIS/P10BTTANKHISvar.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/BTTANKHISitem.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class P10BTTANKHIS_Event {}

class P10BTTANKHIS_GET extends P10BTTANKHIS_Event {}

class P10BTTANKHIS_GET_BYDATE extends P10BTTANKHIS_Event {}

class P10BTTANKHIS_flush extends P10BTTANKHIS_Event {}

class P10BTTANKHIS_Bloc extends Bloc<P10BTTANKHIS_Event, List<BTTANKHISitem>> {
  P10BTTANKHIS_Bloc() : super([]) {
    on<P10BTTANKHIS_GET>((event, emit) {
      return _P10BTTANKHIS_GET([], emit);
    });
    on<P10BTTANKHIS_GET_BYDATE>((event, emit) {
      return _P10BTTANKHIS_GET_BYDATE([], emit);
    });
    on<P10BTTANKHIS_flush>((event, emit) {
      return _P10BTTANKHIS_flush([], emit);
    });
  }
  Future<void> _P10BTTANKHIS_GET(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    FreeLoading(P10BTTANKHISmaincontext);
//P10BTTANKHISmaincontext
    List<BTTANKHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY6",
      data: {
        "query":
            "SELECT TOP (${P10BTTANKHISvar.MAX}) * FROM [Measurement].[dbo].[BT_TANK_DATA] order by [date] desc"
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
    Navigator.pop(P10BTTANKHISmaincontext);
    emit(output);
  }

  Future<void> _P10BTTANKHIS_GET_BYDATE(
      List<BTTANKHISitem> toAdd, Emitter<List<BTTANKHISitem>> emit) async {
    FreeLoading(P10BTTANKHISmaincontext);
//P10BTTANKHISmaincontext
    List<BTTANKHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY6",
      data: {
        "query":
            "SELECT TOP (${P10BTTANKHISvar.MAX}) * FROM [Measurement].[dbo].[BT_TANK_DATA] order by [date] desc"
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
    Navigator.pop(P10BTTANKHISmaincontext);
    emit(output);
  }

  Future<void> _P10BTTANKHIS_flush(
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
