import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P231FINISHEDGOODTRANFER/P231FINISHEDGOODTRANFER.dart';
import '../../page/P231FINISHEDGOODTRANFER/P231FINISHEDGOODTRANFERVAR.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
//-------------------------------------------------

abstract class P231FINISHEDGOODTRANFERget_Event {}

class P231FINISHEDGOODTRANFERget_GET extends P231FINISHEDGOODTRANFERget_Event {}

class P231FINISHEDGOODTRANFERget_GET2
    extends P231FINISHEDGOODTRANFERget_Event {}

class P231FINISHEDGOODTRANFERget_GET3
    extends P231FINISHEDGOODTRANFERget_Event {}

class P231FINISHEDGOODTRANFERget_FLUSH
    extends P231FINISHEDGOODTRANFERget_Event {}

class P231FINISHEDGOODTRANFERget_Bloc extends Bloc<
    P231FINISHEDGOODTRANFERget_Event, List<P231FINISHEDGOODTRANFERgetclass>> {
  P231FINISHEDGOODTRANFERget_Bloc() : super([]) {
    on<P231FINISHEDGOODTRANFERget_GET>((event, emit) {
      return _P231FINISHEDGOODTRANFERget_GET([], emit);
    });

    on<P231FINISHEDGOODTRANFERget_GET2>((event, emit) {
      return _P231FINISHEDGOODTRANFERget_GET2([], emit);
    });
    on<P231FINISHEDGOODTRANFERget_GET3>((event, emit) {
      return _P231FINISHEDGOODTRANFERget_GET3([], emit);
    });
    on<P231FINISHEDGOODTRANFERget_FLUSH>((event, emit) {
      return _P231FINISHEDGOODTRANFERget_FLUSH([], emit);
    });
  }

  Future<void> _P231FINISHEDGOODTRANFERget_GET(
      List<P231FINISHEDGOODTRANFERgetclass> toAdd,
      Emitter<List<P231FINISHEDGOODTRANFERgetclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P231FINISHEDGOODTRANFERgetclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoadingTan(P231FINISHEDGOODTRANFERcontext);
    final response = await Dio().post(
      "${server2}03iPPGETDATACHEM/GETDATA",
      data: {
        "HEADER": {
          "PLANT": "1000",
          "ORD_ST_DATE_FR":
              "${P231FINISHEDGOODTRANFERVAR.day}.${P231FINISHEDGOODTRANFERVAR.month}.${P231FINISHEDGOODTRANFERVAR.year}",
          "ORD_ST_DATE_TO":
              "${P231FINISHEDGOODTRANFERVAR.day_next}.${P231FINISHEDGOODTRANFERVAR.month_next}.${P231FINISHEDGOODTRANFERVAR.year_next}",
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
        for (var i = 0; i < databuff['HEADER_INFO'].length; i++) {
          if (databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString() != '') {
            P231FINISHEDGOODTRANFERgetclass buffer =
                P231FINISHEDGOODTRANFERgetclass();

            buffer = (P231FINISHEDGOODTRANFERgetclass(
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
            ));
            if (buffer.LINK_PROC_ORDER.length > 9) {
              final response2 = await Dio().post(
                "${server2}datacentertest/getsoi8order-ro",
                data: {
                  "PLANT": '',
                  "ORDER":
                      (ConverstStr(buffer.LINK_PROC_ORDER)).substring(4, 10),
                  // ).toString().substring(5, 11),
                },
              );
              if (response2.statusCode == 200) {
                var databuff = response2.data;
                if (databuff.length > 0) {
                  buffer.STATUS = 'Complete';
                  double holddata = 0;
                  for (var s = 0; s < databuff.length; s++) {
                    holddata = holddata +
                        double.parse(
                            ConverstStr(databuff[s]['NumAct'].toString()));
                  }
                  buffer.Yield = holddata.toStringAsFixed(2);
                }
              }

              final response3 = await Dio().post(
                "${server2}datacentertest/getsoi8order-pack-or",
                data: {
                  "PLANT": '',
                  "ORDER":
                      (ConverstStr(buffer.LINK_PROC_ORDER)).substring(4, 10),
                  // ).toString().substring(5, 11),
                  // "PLANT": "liquid",
                  // "ORDER": "227276"
                },
              );
              if (response3.statusCode == 200) {
                // print(response3.statusCode);
                print(response3.data);
                var databuff = response3.data;
                // input = databuff;
                if (databuff.length > 0) {
                  List<String> MATERIAL_TEXT = buffer.MATERIAL_TEXT.split("|");
                  // String PAcksize = '';

                  if (MATERIAL_TEXT.length == 2) {
                    print(MATERIAL_TEXT[1]);
                    // PAcksize =
                    //     (MATERIAL_TEXT[1]).replaceAll(RegExp(r'[^0-9]'), '');
                    buffer.sizep =
                        (MATERIAL_TEXT[1]).replaceAll(RegExp(r'[^0-9]'), '');

                    print(buffer.sizep);
                  }
                  buffer.NumOrder = savenull(databuff[0]['NumOrder']);
                  buffer.NumPackSize1 = (savenull(databuff[0]['NumPackSize1']));
                  buffer.NumQuantity1 = savenull(databuff[0]['NumQuantity1']);
                  buffer.NumPackSize2 = (savenull(databuff[0]['NumPackSize2']));
                  buffer.NumQuantity2 = savenull(databuff[0]['NumQuantity2']);
                  buffer.NumPackSize3 = (savenull(databuff[0]['NumPackSize3']));
                  buffer.NumQuantity3 = savenull(databuff[0]['NumQuantity3']);
                }

                // Navigator.pop(P26PROGRESSMAINcontext);
              }
            }
            output.add(buffer);
          }
        }

        // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
      } else {
        print("where is my server");
      }
    }

    Navigator.pop(P231FINISHEDGOODTRANFERcontext);
    emit(output);
  }

  Future<void> _P231FINISHEDGOODTRANFERget_GET2(
      List<P231FINISHEDGOODTRANFERgetclass> toAdd,
      Emitter<List<P231FINISHEDGOODTRANFERgetclass>> emit) async {
    List<P231FINISHEDGOODTRANFERgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P231FINISHEDGOODTRANFERgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P231FINISHEDGOODTRANFERget_GET3(
      List<P231FINISHEDGOODTRANFERgetclass> toAdd,
      Emitter<List<P231FINISHEDGOODTRANFERgetclass>> emit) async {
    List<P231FINISHEDGOODTRANFERgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P231FINISHEDGOODTRANFERgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P231FINISHEDGOODTRANFERget_FLUSH(
      List<P231FINISHEDGOODTRANFERgetclass> toAdd,
      Emitter<List<P231FINISHEDGOODTRANFERgetclass>> emit) async {
    List<P231FINISHEDGOODTRANFERgetclass> output = [];
    emit(output);
  }
}

class P231FINISHEDGOODTRANFERgetclass {
  P231FINISHEDGOODTRANFERgetclass({
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
//
    this.STATUS = '',
    this.Yield = '',
    this.NumOrder = '',
    this.NumPackSize1 = '',
    this.NumQuantity1 = '',
    this.NumPackSize2 = '',
    this.NumQuantity2 = '',
    this.NumPackSize3 = '',
    this.NumQuantity3 = '',
    this.check = false,
    this.sizep = '',
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
//
  String STATUS;
  String Yield;

  String NumOrder;
  String NumPackSize1;
  String NumQuantity1;
  String NumPackSize2;
  String NumQuantity2;
  String NumPackSize3;
  String NumQuantity3;

  bool check;

  String sizep;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
