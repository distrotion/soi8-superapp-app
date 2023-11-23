import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../page/P31QCSAPMASTER/P31QCSAPMASTERmain.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/QCSAPMASTERtable.dart';
import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

//

abstract class QCSAPMASTER_Event {}

class QCSAPMASTER_GET extends QCSAPMASTER_Event {}

class QCSAPMASTER_flush extends QCSAPMASTER_Event {}

class QCSAPMASTER_Bloc extends Bloc<QCSAPMASTER_Event, List<QCSAPMASTERitem>> {
  QCSAPMASTER_Bloc() : super([]) {
    on<QCSAPMASTER_GET>((event, emit) {
      return _QCSAPMASTER_GET([], emit);
    });
    on<QCSAPMASTER_flush>((event, emit) {
      return _QCSAPMASTER_flush([], emit);
    });
  }
  Future<void> _QCSAPMASTER_GET(
      List<QCSAPMASTERitem> toAdd, Emitter<List<QCSAPMASTERitem>> emit) async {
    List<QCSAPMASTERitem> output = [];
    FreeLoading(P31QCSAPMASTERmaincontext);
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERYM",
      data: {
        "query": {
          // "MKMNR": {'\$regex': "2065"}
        }
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(QCSAPMASTERitem(
          text01: StringChecknull(databuff[i]['MKMNR']),
          text02: StringChecknull(databuff[i]['Material']),
          text03: StringChecknull(databuff[i]['SORTFELD']),
          text04: StringChecknull(databuff[i]['KURZTEXT']),
          text05: StringChecknull(databuff[i]['qc']),
        ));
      }
    }
    Navigator.pop(P31QCSAPMASTERmaincontext);
    emit(output);
  }

  Future<void> _QCSAPMASTER_flush(
      List<QCSAPMASTERitem> toAdd, Emitter<List<QCSAPMASTERitem>> emit) async {
    List<QCSAPMASTERitem> output = [];
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
