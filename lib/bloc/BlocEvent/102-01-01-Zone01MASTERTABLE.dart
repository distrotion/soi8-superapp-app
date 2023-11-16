import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../widget/common/Safty.dart';
import '../../widget/table/mastertablewidget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class Zone01MASTERTABLE_Event {}

class Zone01MASTERTABLE_GET extends Zone01MASTERTABLE_Event {}

class Zone01MASTERTABLE_flush extends Zone01MASTERTABLE_Event {}

class Zone01MASTERTABLE_Bloc
    extends Bloc<Zone01MASTERTABLE_Event, List<TABLECOLUNMNMASTER>> {
  Zone01MASTERTABLE_Bloc() : super([]) {
    on<Zone01MASTERTABLE_GET>((event, emit) {
      return _Zone01MASTERTABLE_GET([], emit);
    });
    on<Zone01MASTERTABLE_flush>((event, emit) {
      return _Zone01MASTERTABLE_flush([], emit);
    });
  }
  Future<void> _Zone01MASTERTABLE_GET(List<TABLECOLUNMNMASTER> toAdd,
      Emitter<List<TABLECOLUNMNMASTER>> emit) async {
    List<TABLECOLUNMNMASTER> output = [];
    final response = await Dio().post(
      server + "INVSYSTEM/GETMASTER",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(TABLECOLUNMNMASTER(
          text01: StringChecknull(databuff[i]['date']),
          text02: StringChecknull(databuff[i]['MATID']),
          text03: StringChecknull(databuff[i]['MATNAME']),
          text04: StringChecknull(databuff[i]['USER']),
          text05: StringChecknull(databuff[i]['USER_UPDATE']),
        ));
      }
    }
    emit(output);
  }

  Future<void> _Zone01MASTERTABLE_flush(List<TABLECOLUNMNMASTER> toAdd,
      Emitter<List<TABLECOLUNMNMASTER>> emit) async {
    List<TABLECOLUNMNMASTER> output = [];
    emit(output);
  }
}
