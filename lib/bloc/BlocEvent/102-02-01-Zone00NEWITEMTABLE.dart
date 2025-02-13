import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverINV;

abstract class ZONE00NEWITEMTABLE_Event {}

class ZONE00NEWITEMTABLE_GET extends ZONE00NEWITEMTABLE_Event {}

class ZONE00NEWITEMTABLE_flush extends ZONE00NEWITEMTABLE_Event {}

class ZONE00NEWITEMTABLE_Bloc
    extends Bloc<ZONE00NEWITEMTABLE_Event, List<TABLECOLUNMNNEWTABLET>> {
  ZONE00NEWITEMTABLE_Bloc() : super([]) {
    on<ZONE00NEWITEMTABLE_GET>((event, emit) {
      return _ZONE00NEWITEMTABLE_GET([], emit);
    });
    on<ZONE00NEWITEMTABLE_flush>((event, emit) {
      return _ZONE00NEWITEMTABLE_flush([], emit);
    });
  }
  Future<void> _ZONE00NEWITEMTABLE_GET(List<TABLECOLUNMNNEWTABLET> toAdd,
      Emitter<List<TABLECOLUNMNNEWTABLET>> emit) async {
    List<TABLECOLUNMNNEWTABLET> output = [];
    final response = await Dio().post(
      server + "INVSYSTEM/GETITEM",
      data: {"ZONE": "TEST-0"},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

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

  Future<void> _ZONE00NEWITEMTABLE_flush(List<TABLECOLUNMNNEWTABLET> toAdd,
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
