import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../mainBody.dart';

import '../../page/P20REGISTORAP/P20REGISTORAPvar.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
// String server = 'http://127.0.0.1:15000/';
String server = serverQC;

abstract class RegisterPOID_Event {}

class RegisterPOID_Pressed extends RegisterPOID_Event {}

class RejectPOID_Pressed extends RegisterPOID_Event {}

class RegisterPOID_Bloc extends Bloc<RegisterPOID_Event, int> {
  RegisterPOID_Bloc() : super(0) {
    on<RegisterPOID_Pressed>((event, emit) {
      return _RegisterPOID_Function(0, emit);
    });
  }
  Future<void> _RegisterPOID_Function(int toAdd, Emitter<int> emit) async {
    final response = await Dio().post(
      server + "RegisterPOAP",
      data: {
        "PO": P20REGISTORAPvar.POINPUT,
        "ID": USERDATA.ID,
        "COMMENT": P20REGISTORAPvar.COMMENT,
      },
    );
    int output = 0;

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      if (databuff.toString() == 'The order have already had in DB') {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "Success", "POID have existed", enumNotificationlist.Warning);
        output = 1;
      } else {
        if (databuff == 'The MAT NO. Incorrect') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Warning", databuff, enumNotificationlist.Warning);
        } else {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Success", databuff, enumNotificationlist.Success);
        }

        output = 2;
      }
    } else {
      output = 3;
    }
    emit(output);
  }
}
