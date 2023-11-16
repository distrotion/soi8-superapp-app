import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class Zone01NEWITEMTABLE_Event {}

class Zone01NEWITEMTABLE_GET extends Zone01NEWITEMTABLE_Event {}

class Zone01NEWITEMTABLE_flush extends Zone01NEWITEMTABLE_Event {}

class Zone01NEWITEMTABLE_Bloc
    extends Bloc<Zone01NEWITEMTABLE_Event, List<TABLECOLUNMNNEWTABLET>> {
  Zone01NEWITEMTABLE_Bloc() : super([]) {
    on<Zone01NEWITEMTABLE_GET>((event, emit) {
      return _Zone01NEWITEMTABLE_GET([], emit);
    });
    on<Zone01NEWITEMTABLE_flush>((event, emit) {
      return _Zone01NEWITEMTABLE_flush([], emit);
    });
  }
  Future<void> _Zone01NEWITEMTABLE_GET(List<TABLECOLUNMNNEWTABLET> toAdd,
      Emitter<List<TABLECOLUNMNNEWTABLET>> emit) async {
    List<TABLECOLUNMNNEWTABLET> output = [];
    final response = await Dio().post(
      server + "INVSYSTEM/GETITEM",
      data: {"ZONE": "ZONE01"},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(TABLECOLUNMNNEWTABLET(
          text01: StringChecknull(databuff[i]['date']),
          text02: StringChecknull(databuff[i]['ITEMID']),
          text03: StringChecknull(databuff[i]['ITEMNAME']),
          text04: StringChecknull(databuff[i]['LOTNO']),
          text05: StringChecknull(databuff[i]['LOCATION']),
          text06: _unixTimestampTOStringDateTime(int.parse(
              ConverstStr(StringChecknull(databuff[i]['STOREDATE'])))),
          text07: _unixTimestampTOStringDateTimeT(int.parse(
              ConverstStr(StringChecknull(databuff[i]['STOREDATE'])))),
          text08: StringChecknull(databuff[i]['TotalQuantity']),
        ));
      }
    }
    emit(output);
  }

  Future<void> _Zone01NEWITEMTABLE_flush(List<TABLECOLUNMNNEWTABLET> toAdd,
      Emitter<List<TABLECOLUNMNNEWTABLET>> emit) async {
    List<TABLECOLUNMNNEWTABLET> output = [];
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
