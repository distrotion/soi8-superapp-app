import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P102zone01/Zone00VAR.dart';
import '../../widget/common/Safty.dart';
import '../../widget/table/mastertablewidget.dart';

//-------------------------------------------------
String server = serverINV;

abstract class ZONE00MASTERTABLE_Event {}

class ZONE00MASTERTABLE_GET extends ZONE00MASTERTABLE_Event {}

class ZONE00MASTERTABLE_SET extends ZONE00MASTERTABLE_Event {}

class ZONE00MASTERTABLE_flush extends ZONE00MASTERTABLE_Event {}

class ZONE00MASTERTABLE_Bloc
    extends Bloc<ZONE00MASTERTABLE_Event, List<INVAMASTERCLASS>> {
  ZONE00MASTERTABLE_Bloc() : super([]) {
    on<ZONE00MASTERTABLE_GET>((event, emit) {
      return _ZONE00MASTERTABLE_GET([], emit);
    });
    on<ZONE00MASTERTABLE_SET>((event, emit) {
      return _ZONE00MASTERTABLE_SET([], emit);
    });
    on<ZONE00MASTERTABLE_flush>((event, emit) {
      return _ZONE00MASTERTABLE_flush([], emit);
    });
  }
  Future<void> _ZONE00MASTERTABLE_GET(
      List<INVAMASTERCLASS> toAdd, Emitter<List<INVAMASTERCLASS>> emit) async {
    List<INVAMASTERCLASS> output = [];
    final response = await Dio().post(
      server + "INVSYSTEM/GETMASTER",
      data: {"ZONE": " WHERE [TEST-0]= 'YES' "},
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

    emit(output);
  }

  Future<void> _ZONE00MASTERTABLE_SET(
      List<INVAMASTERCLASS> toAdd, Emitter<List<INVAMASTERCLASS>> emit) async {
    List<INVAMASTERCLASS> output = [];
    print("-----------------");
    final response = await Dio().post(
      server + "INVSYSTEM/SETMASTER",
      data: {
        "UID": ZONE00MASTERVAR.UID,
        "MATID": ZONE00MASTERVAR.MATID,
        "Description": ZONE00MASTERVAR.Description,
        "GROUP": ZONE00MASTERVAR.GROUP,
        "PACKING_TYPE": ZONE00MASTERVAR.PACKING_TYPE,
        "BUn": ZONE00MASTERVAR.BUn,
        "PACKET_SIZE": ZONE00MASTERVAR.PACKET_SIZE,
        "Safty_Stock": ZONE00MASTERVAR.Safty_Stock,
        "Safty_Stock_UNIT": ZONE00MASTERVAR.Safty_Stock_UNIT,
        "AGE": ZONE00MASTERVAR.AGE,
        "AGE_TYPE": ZONE00MASTERVAR.AGE_TYPE,
        "MATER_TYPE": ZONE00MASTERVAR.MATER_TYPE,
        "LEAD": ZONE00MASTERVAR.LEAD,
        "LEAD_UNIT": ZONE00MASTERVAR.LEAD_UNIT,
        "CLASS": ZONE00MASTERVAR.CLASS,
        "MINAGE": ZONE00MASTERVAR.MINAGE,
        "ITEMNAME_F_FULL": ZONE00MASTERVAR.ITEMNAME_F_FULL,
        "ITEMNAME_F": ZONE00MASTERVAR.ITEMNAME_F,
        "ITEMNAME_R_CODE": ZONE00MASTERVAR.ITEMNAME_R_CODE,
        "ITEMNAME_R_TD": ZONE00MASTERVAR.ITEMNAME_R_TD,
        "STATUS": "Active",
        "FG1": ZONE00MASTERVAR.FG1,
        "FG2": ZONE00MASTERVAR.FG2,
        "FG3": ZONE00MASTERVAR.FG3,
        "FG4": ZONE00MASTERVAR.FG4,
        "FG5": ZONE00MASTERVAR.FG5,
        "FG6": ZONE00MASTERVAR.FG6,
        "FG7": ZONE00MASTERVAR.FG7,
        "FG8": ZONE00MASTERVAR.FG8,
        "FG9": ZONE00MASTERVAR.FG9,
        "FG10": ZONE00MASTERVAR.FG10,
        "RM1": ZONE00MASTERVAR.RM1,
        "RM2": ZONE00MASTERVAR.RM2,
        "RM3": ZONE00MASTERVAR.RM3,
        "RM4": ZONE00MASTERVAR.RM4,
        "RM5": ZONE00MASTERVAR.RM5,
        "RM6": ZONE00MASTERVAR.RM6,
        "RM7": ZONE00MASTERVAR.RM7,
        "RM8": ZONE00MASTERVAR.RM8,
        "RM9": ZONE00MASTERVAR.RM9,
        "RM10": ZONE00MASTERVAR.RM10,
        "RM11": ZONE00MASTERVAR.RM11,
        "CR1": ZONE00MASTERVAR.CR1,
        "TEST0": ZONE00MASTERVAR.TEST0,
        "Location_Plants": ZONE00MASTERVAR.Location_Plants,
        "Location_Stock": ZONE00MASTERVAR.Location_Stock,
        "User_Create": ZONE00MASTERVAR.User_Create,
        "User_Edit": ZONE00MASTERVAR.User_Edit,
      },
    );

    emit(output);
  }

  Future<void> _ZONE00MASTERTABLE_flush(
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
