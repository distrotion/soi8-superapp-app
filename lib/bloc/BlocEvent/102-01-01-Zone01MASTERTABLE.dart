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
    extends Bloc<Zone01MASTERTABLE_Event, List<INVAMASTERCLASS>> {
  Zone01MASTERTABLE_Bloc() : super([]) {
    on<Zone01MASTERTABLE_GET>((event, emit) {
      return _Zone01MASTERTABLE_GET([], emit);
    });
    on<Zone01MASTERTABLE_flush>((event, emit) {
      return _Zone01MASTERTABLE_flush([], emit);
    });
  }
  Future<void> _Zone01MASTERTABLE_GET(
      List<INVAMASTERCLASS> toAdd, Emitter<List<INVAMASTERCLASS>> emit) async {
    List<INVAMASTERCLASS> output = [];
    final response = await Dio().post(
      server + "INVSYSTEM/GETMASTER",
      data: {"ZONE": " WHERE [ZONE]= 1 "},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);

      for (var i = 0; i < databuff.length; i++) {
        output.add(INVAMASTERCLASS(
          date: StringChecknull(databuff[i]['date']),
          UID: StringChecknull(databuff[i]['UID']),
          GROUP: StringChecknull(databuff[i]['GROUP']),
          MATID: StringChecknull(databuff[i]['MATID']),
          MATNAME: StringChecknull(databuff[i]['MATNAME']),
          TYPE: StringChecknull(databuff[i]['TYPE']),
          USER: StringChecknull(databuff[i]['USER']),
          USER_UPDATE: StringChecknull(databuff[i]['USER_UPDATE']),
          BASE_UNIT: StringChecknull(databuff[i]['BASE_UNIT']),
          PACKET_SIZE: StringChecknull(databuff[i]['PACKET_SIZE']),
          PACKING_TYPE: StringChecknull(databuff[i]['PACKING_TYPE']),
          AGE: StringChecknull(databuff[i]['AGE']),
          AGE_TYPE: StringChecknull(databuff[i]['AGE_TYPE']),
          Safty_Stock: StringChecknull(databuff[i]['Safty_Stock']),
          Safty_Stock_UNIT: StringChecknull(databuff[i]['Safty_Stock_UNIT']),
          MATER_TYPE: StringChecknull(databuff[i]['MATER_TYPE']),
          LEAD: StringChecknull(databuff[i]['LEAD']),
          LEAD_UNIT: StringChecknull(databuff[i]['LEAD_UNIT']),
          CLASS: StringChecknull(databuff[i]['CLASS']),
          MINAGE: StringChecknull(databuff[i]['MINAGE']),
          ITEMNAME_F_FULL: StringChecknull(databuff[i]['ITEMNAME_F_FULL']),
          ITEMNAME_F: StringChecknull(databuff[i]['ITEMNAME_F']),
          ITEMNAME_R_CODE: StringChecknull(databuff[i]['ITEMNAME_R_CODE']),
          ITEMNAME_R_TD: StringChecknull(databuff[i]['ITEMNAME_R_TD']),
          ZONE: StringChecknull(databuff[i]['ZONE']),
          LOCATION: StringChecknull(databuff[i]['LOCATION']),
          LOCATION_CLASS: StringChecknull(databuff[i]['LOCATION_CLASS']),
        ));
      }
    }
    print(output);
    emit(output);
  }

  Future<void> _Zone01MASTERTABLE_flush(
      List<INVAMASTERCLASS> toAdd, Emitter<List<INVAMASTERCLASS>> emit) async {
    List<INVAMASTERCLASS> output = [];
    emit(output);
  }
}

class INVAMASTERCLASS {
  INVAMASTERCLASS({
    this.date = '',
    this.UID = '',
    this.GROUP = '',
    this.MATID = '',
    this.MATNAME = '',
    this.TYPE = '',
    this.USER = '',
    this.UPDATEDATE = '',
    this.USER_UPDATE = '',
    this.BASE_UNIT = '',
    this.PACKET_SIZE = '',
    this.PACKING_TYPE = '',
    this.AGE = '',
    this.AGE_TYPE = '',
    this.Safty_Stock = '',
    this.Safty_Stock_UNIT = '',
    this.MATER_TYPE = '',
    this.LEAD = '',
    this.LEAD_UNIT = '',
    this.CLASS = '',
    this.MINAGE = '',
    this.ITEMNAME_F_FULL = '',
    this.ITEMNAME_F = '',
    this.ITEMNAME_R_CODE = '',
    this.ITEMNAME_R_TD = '',
    this.ZONE = '',
    this.LOCATION = '',
    this.LOCATION_CLASS = '',
  });
  String date;
  String UID;
  String GROUP;
  String MATID;
  String MATNAME;
  String TYPE;
  String USER;
  String UPDATEDATE;
  String USER_UPDATE;
  String BASE_UNIT;
  String PACKET_SIZE;
  String PACKING_TYPE;
  String AGE;
  String AGE_TYPE;
  String Safty_Stock;
  String Safty_Stock_UNIT;
  String MATER_TYPE;
  String LEAD;
  String LEAD_UNIT;
  String CLASS;
  String MINAGE;
  String ITEMNAME_F_FULL;
  String ITEMNAME_F;
  String ITEMNAME_R_CODE;
  String ITEMNAME_R_TD;
  String ZONE;
  String LOCATION;
  String LOCATION_CLASS;
}
