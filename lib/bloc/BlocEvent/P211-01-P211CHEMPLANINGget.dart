import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P211CHEMPLANING/P211CHEMPLANINGVAR.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
//-------------------------------------------------

abstract class P211CHEMPLANINGget_Event {}

class P211CHEMPLANINGget_GET extends P211CHEMPLANINGget_Event {}

class P211CHEMPLANINGget_GET2 extends P211CHEMPLANINGget_Event {}

class P211CHEMPLANINGget_GET3 extends P211CHEMPLANINGget_Event {}

class P211CHEMPLANINGget_FLUSH extends P211CHEMPLANINGget_Event {}

class P211CHEMPLANINGget_Bloc
    extends Bloc<P211CHEMPLANINGget_Event, List<P211CHEMPLANINGgetclass>> {
  P211CHEMPLANINGget_Bloc() : super([]) {
    on<P211CHEMPLANINGget_GET>((event, emit) {
      return _P211CHEMPLANINGget_GET([], emit);
    });

    on<P211CHEMPLANINGget_GET2>((event, emit) {
      return _P211CHEMPLANINGget_GET2([], emit);
    });
    on<P211CHEMPLANINGget_GET3>((event, emit) {
      return _P211CHEMPLANINGget_GET3([], emit);
    });
    on<P211CHEMPLANINGget_FLUSH>((event, emit) {
      return _P211CHEMPLANINGget_FLUSH([], emit);
    });
  }

  Future<void> _P211CHEMPLANINGget_GET(List<P211CHEMPLANINGgetclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P211CHEMPLANINGgetclass> output = [];
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

      if (databuff['HEADER_INFO'].length > 0) {
        P211CHEMPLANINGgetclass buffer = P211CHEMPLANINGgetclass();
        for (var i = 0; i < databuff['HEADER_INFO'].length; i++) {
          // if (databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString() == '') {
          if (true) {
            buffer = P211CHEMPLANINGgetclass(
              PROCESS_ORDER:
                  databuff['HEADER_INFO'][i]['PROCESS_ORDER'].toString(),
              ORDER_TYPE: databuff['HEADER_INFO'][i]['ORDER_TYPE'].toString(),
              ORDER_TYPE_DESC:
                  databuff['HEADER_INFO'][i]['ORDER_TYPE_DESC'].toString(),
              PLANT: databuff['HEADER_INFO'][i]['PLANT'].toString(),
              MATERIAL: databuff['HEADER_INFO'][i]['MATERIAL'].toString(),
              MATERIAL_TEXT:
                  databuff['HEADER_INFO'][i]['MATERIAL_TEXT'].toString(),
              TOTAL_QTY: databuff['HEADER_INFO'][i]['TOTAL_QTY'].toString(),
              UOM: databuff['HEADER_INFO'][i]['UOM'].toString(),
              PROD_SUP: databuff['HEADER_INFO'][i]['PROD_SUP'].toString(),
              PROD_SUP_DESC:
                  databuff['HEADER_INFO'][i]['PROD_SUP_DESC'].toString(),
              BASIC_START_DATE:
                  databuff['HEADER_INFO'][i]['BASIC_START_DATE'].toString(),
              BASIC_FINISH_DATE:
                  databuff['HEADER_INFO'][i]['BASIC_FINISH_DATE'].toString(),
              ORDER_SEQ_NO:
                  databuff['HEADER_INFO'][i]['ORDER_SEQ_NO'].toString(),
              BATCH: databuff['HEADER_INFO'][i]['BATCH'].toString(),
              STGE_LOC: databuff['HEADER_INFO'][i]['STGE_LOC'].toString(),
              INSP_LOT: databuff['HEADER_INFO'][i]['INSP_LOT'].toString(),
              SYSTEM_STATUS:
                  databuff['HEADER_INFO'][i]['SYSTEM_STATUS'].toString(),
              OLD_MATERIAL:
                  databuff['HEADER_INFO'][i]['OLD_MATERIAL'].toString(),
              MTART: databuff['HEADER_INFO'][i]['MTART'].toString(),
              MTBEZ: databuff['HEADER_INFO'][i]['MTBEZ'].toString(),
              LINK_PROC_ORDER: databuff['HEADER_INFO'][i]['LINK_PROC_ORDER']
                          .toString() ==
                      'Manual Create'
                  ? databuff['HEADER_INFO'][i]['ORDER_SEQ_NO'].toString()
                  : databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString(),
            );

            final response2 = await Dio().post(
              "${server2}datacentertest/getsoi8order-ro",
              data: {
                "PLANT": 'liquid',
                "ORDER": (ConverstStr(buffer.PROCESS_ORDER)).substring(4, 10),
                // ).toString().substring(5, 11),
              },
            );
            if (response2.statusCode == 200) {
              var databuff = response2.data;
              if (databuff.length > 0) {
                double holddata = 0;
                for (var s = 0; s < databuff.length; s++) {
                  buffer.STATUS = 'SCADA Complete';
                }
              }
            }
            output.add(buffer);
          }
        }
      }

      // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    } else {
      print("where is my server");
    }

    emit(output);
  }

  Future<void> _P211CHEMPLANINGget_GET2(List<P211CHEMPLANINGgetclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetclass>> emit) async {
    List<P211CHEMPLANINGgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P211CHEMPLANINGgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P211CHEMPLANINGget_GET3(List<P211CHEMPLANINGgetclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetclass>> emit) async {
    List<P211CHEMPLANINGgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P211CHEMPLANINGgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P211CHEMPLANINGget_FLUSH(List<P211CHEMPLANINGgetclass> toAdd,
      Emitter<List<P211CHEMPLANINGgetclass>> emit) async {
    List<P211CHEMPLANINGgetclass> output = [];
    emit(output);
  }
}

class P211CHEMPLANINGgetclass {
  P211CHEMPLANINGgetclass({
    this.PROCESS_ORDER = '',
    this.ORDER_TYPE = '',
    this.ORDER_TYPE_DESC = '',
    this.PLANT = '',
    this.MATERIAL = '',
    this.MATERIAL_TEXT = '',
    this.TOTAL_QTY = '',
    this.UOM = '',
    this.PROD_SUP = '',
    this.PROD_SUP_DESC = '',
    this.BASIC_START_DATE = '',
    this.BASIC_FINISH_DATE = '',
    this.ORDER_SEQ_NO = '',
    this.BATCH = '',
    this.STGE_LOC = '',
    this.INSP_LOT = '',
    this.SYSTEM_STATUS = '',
    this.OLD_MATERIAL = '',
    this.MTART = '',
    this.MTBEZ = '',
    this.LINK_PROC_ORDER = '',
    this.STATUS = '',
  });

  String PROCESS_ORDER;
  String ORDER_TYPE;
  String ORDER_TYPE_DESC;
  String PLANT;
  String MATERIAL;
  String MATERIAL_TEXT;
  String TOTAL_QTY;
  String UOM;
  String PROD_SUP;
  String PROD_SUP_DESC;
  String BASIC_START_DATE;
  String BASIC_FINISH_DATE;
  String ORDER_SEQ_NO;
  String BATCH;
  String STGE_LOC;
  String INSP_LOT;
  String SYSTEM_STATUS;
  String OLD_MATERIAL;
  String MTART;
  String MTBEZ;
  String LINK_PROC_ORDER;
  String STATUS;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
