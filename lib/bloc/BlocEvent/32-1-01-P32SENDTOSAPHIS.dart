import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/global.dart';
import '../../widget/common/Safty.dart';

import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/SENDTOSAPHIStable.dart';
import '../../widget/table/newitemtablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class SENDTOSAPHIS_Event {}

class SENDTOSAPHIS_GET extends SENDTOSAPHIS_Event {}

class SENDTOSAPHIS_flush extends SENDTOSAPHIS_Event {}

class SENDTOSAPHIS_Bloc
    extends Bloc<SENDTOSAPHIS_Event, List<SENDTOSAPHISitem>> {
  SENDTOSAPHIS_Bloc() : super([]) {
    on<SENDTOSAPHIS_GET>((event, emit) {
      return _SENDTOSAPHIS_GET([], emit);
    });
    on<SENDTOSAPHIS_flush>((event, emit) {
      return _SENDTOSAPHIS_flush([], emit);
    });
  }
  Future<void> _SENDTOSAPHIS_GET(List<SENDTOSAPHISitem> toAdd,
      Emitter<List<SENDTOSAPHISitem>> emit) async {
    List<SENDTOSAPHISitem> output = [];
    final response = await Dio().post(
      server + "PRODUCTIONHISTORY/FREEQUERY",
      data: {
        "query":
            "SELECT TOP (200) * FROM [SOI8LOG].[dbo].[gosaplog] order by [date] desc"
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(SENDTOSAPHISitem(
          text01: StringChecknull(databuff[i]['date']),
          text02: StringChecknull(databuff[i]['mat']),
          text03: StringChecknull(databuff[i]['po']),
          text04: StringChecknull(databuff[i]['item']),
          text05: StringChecknull(databuff[i]['itemno']),
          text06: StringChecknull(databuff[i]['masterins']),
          text07: StringChecknull(databuff[i]['value']),
          text08: StringChecknull(databuff[i]['massage']),
        ));
      }
    }
    emit(output);
  }

  Future<void> _SENDTOSAPHIS_flush(List<SENDTOSAPHISitem> toAdd,
      Emitter<List<SENDTOSAPHISitem>> emit) async {
    List<SENDTOSAPHISitem> output = [];
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
