import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P211CHEMPLANING/P211CHEMPLANINGVAR.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

abstract class P211CHEMPLANINGgetsub_Event {}

class P211CHEMPLANINGgetsub_GET extends P211CHEMPLANINGgetsub_Event {}

class P211CHEMPLANINGgetsub_GET2 extends P211CHEMPLANINGgetsub_Event {}

class P211CHEMPLANINGgetsub_GET3 extends P211CHEMPLANINGgetsub_Event {}

class P211CHEMPLANINGgetsub_FLUSH extends P211CHEMPLANINGgetsub_Event {}

class P211CHEMPLANINGgetsub_Bloc extends Bloc<P211CHEMPLANINGgetsub_Event,
    List<P211CHEMPLANINGgetsubclass>> {
  P211CHEMPLANINGgetsub_Bloc() : super([]) {
    on<P211CHEMPLANINGgetsub_GET>((event, emit) {
      return _P211CHEMPLANINGgetsub_GET([], emit);
    });

    on<P211CHEMPLANINGgetsub_GET2>((event, emit) {
      return _P211CHEMPLANINGgetsub_GET2([], emit);
    });
    on<P211CHEMPLANINGgetsub_GET3>((event, emit) {
      return _P211CHEMPLANINGgetsub_GET3([], emit);
    });
    on<P211CHEMPLANINGgetsub_FLUSH>((event, emit) {
      return _P211CHEMPLANINGgetsub_FLUSH([], emit);
    });
  }

  Future<void> _P211CHEMPLANINGgetsub_GET(
      List<P211CHEMPLANINGgetsubclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetsubclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P211CHEMPLANINGgetsubclass> output = [];
    //-------------------------------------------------------------------------------------
    final response = await Dio().post(
      "${server2}03iPPGETDATACHEM/GETDATA",
      data: {
        "HEADER": {
          "PLANT": "1000",
          "ORD_ST_DATE_FR":
              "${P211CHEMPLANINGVAR.day}.${P211CHEMPLANINGVAR.month}.${P211CHEMPLANINGVAR.year}",
          "ORD_ST_DATE_TO":
              "${P211CHEMPLANINGVAR.day_next}.${P211CHEMPLANINGVAR.month_next}.${P211CHEMPLANINGVAR.year_next}",
          "ORDER_TYPE": "",
          "PROD_SUP": ""
        },
        "PROC_ORD": [
          {"PROCESS_ORDER": "", "MATERIAL": ""}
        ]
      },
    );
    var input = [];
    // Navigator.pop(P19PROGRESSMAINcontext);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      var databuff = response.data;

      if (databuff['COMPONENT_INFO'].length > 0) {
        for (var i = 0; i < databuff['COMPONENT_INFO'].length; i++) {
          if (P211CHEMPLANINGVAR.PROCESS_ORDERselect ==
              databuff['COMPONENT_INFO'][i]['PROCESS_ORDER'].toString()) {
            output.add(P211CHEMPLANINGgetsubclass(
              PROCESS_ORDER:
                  databuff['COMPONENT_INFO'][i]['PROCESS_ORDER'].toString(),
              ITEM: databuff['COMPONENT_INFO'][i]['ITEM'].toString(),
              MATERIAL: databuff['COMPONENT_INFO'][i]['MATERIAL'].toString(),
              MATERIAL_TEXT:
                  databuff['COMPONENT_INFO'][i]['MATERIAL_TEXT'].toString(),
              REQ_QTY: databuff['COMPONENT_INFO'][i]['REQ_QTY'].toString(),
              UOM: databuff['COMPONENT_INFO'][i]['UOM'].toString(),
              ITEM_CATE: databuff['COMPONENT_INFO'][i]['ITEM_CATE'].toString(),
              NO_OF_BATCH:
                  databuff['COMPONENT_INFO'][i]['NO_OF_BATCH'].toString(),
              BATCH: databuff['COMPONENT_INFO'][i]['BATCH'].toString(),
              BATCH_QTY: databuff['COMPONENT_INFO'][i]['BATCH_QTY'].toString(),
              BATCH_UOM: databuff['COMPONENT_INFO'][i]['BATCH_UOM'].toString(),
              STGE_LOC: databuff['COMPONENT_INFO'][i]['STGE_LOC'].toString(),
              MVT_TYPE: databuff['COMPONENT_INFO'][i]['MVT_TYPE'].toString(),
              OPERATION: databuff['COMPONENT_INFO'][i]['OPERATION'].toString(),
            ));
          }
        }
      }

      // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    } else {
      print("where is my server");
    }

    emit(output);
  }

  Future<void> _P211CHEMPLANINGgetsub_GET2(
      List<P211CHEMPLANINGgetsubclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetsubclass>> emit) async {
    List<P211CHEMPLANINGgetsubclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P211CHEMPLANINGgetsubclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P211CHEMPLANINGgetsub_GET3(
      List<P211CHEMPLANINGgetsubclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetsubclass>> emit) async {
    List<P211CHEMPLANINGgetsubclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P211CHEMPLANINGgetsubclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P211CHEMPLANINGgetsub_FLUSH(
      List<P211CHEMPLANINGgetsubclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetsubclass>> emit) async {
    List<P211CHEMPLANINGgetsubclass> output = [];
    emit(output);
  }
}

class P211CHEMPLANINGgetsubclass {
  P211CHEMPLANINGgetsubclass({
    this.PROCESS_ORDER = '',
    this.ITEM = '',
    this.MATERIAL = '',
    this.MATERIAL_TEXT = '',
    this.REQ_QTY = '',
    this.UOM = '',
    this.ITEM_CATE = '',
    this.NO_OF_BATCH = '',
    this.BATCH = '',
    this.BATCH_QTY = '',
    this.BATCH_UOM = '',
    this.STGE_LOC = '',
    this.MVT_TYPE = '',
    this.OPERATION = '',
  });

  String PROCESS_ORDER;
  String ITEM;
  String MATERIAL;
  String MATERIAL_TEXT;
  String REQ_QTY;
  String UOM;
  String ITEM_CATE;
  String NO_OF_BATCH;
  String BATCH;
  String BATCH_QTY;
  String BATCH_UOM;
  String STGE_LOC;
  String MVT_TYPE;
  String OPERATION;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
