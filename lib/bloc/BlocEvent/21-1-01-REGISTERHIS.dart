import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class REGISTERHIS_Event {}

class REGISTERHIS_GET extends REGISTERHIS_Event {}

class REGISTERHIS_flush extends REGISTERHIS_Event {}

class REGISTERHIS_Bloc extends Bloc<REGISTERHIS_Event, List<REGISTERAPitem>> {
  REGISTERHIS_Bloc() : super([]) {
    on<REGISTERHIS_GET>((event, emit) {
      return _REGISTERHIS_GET([], emit);
    });
    on<REGISTERHIS_flush>((event, emit) {
      return _REGISTERHIS_flush([], emit);
    });
  }
  Future<void> _REGISTERHIS_GET(
      List<REGISTERAPitem> toAdd, Emitter<List<REGISTERAPitem>> emit) async {
    List<REGISTERAPitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY",
      data: {
        "query":
            "SELECT TOP (200) * FROM [SOI8LOG].[dbo].[qcbypass_weight] order by [date] desc"
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(REGISTERAPitem(
          text01: StringChecknull(databuff[i]['date']),
          text02: StringChecknull(databuff[i]['POID']),
          text03: StringChecknull(databuff[i]['USERID']),
          text04: StringChecknull(databuff[i]['PLANT']),
          text05: StringChecknull(databuff[i]['ProductName']),
          text06: StringChecknull(databuff[i]['COMMENT']),
        ));
      }
    }
    emit(output);
  }

  Future<void> _REGISTERHIS_flush(
      List<REGISTERAPitem> toAdd, Emitter<List<REGISTERAPitem>> emit) async {
    List<REGISTERAPitem> output = [];
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
