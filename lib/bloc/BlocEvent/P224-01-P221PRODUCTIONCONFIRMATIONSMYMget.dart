import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

import '../../page/P211CHEMPLANING/P211CHEMPLANING.dart';

import '../../page/P224P221PRODUCTIONCONFIRMATIONSMYE/P224PRODUCTIONCONFIRMATIONSMYE.dart';
import '../../page/P224P221PRODUCTIONCONFIRMATIONSMYE/P224PRODUCTIONCONFIRMATIONSMYEVAR.dart';

import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
//-------------------------------------------------

abstract class P224PRODUCTIONCONFIRMATIONSMYEget_Event {}

class P224PRODUCTIONCONFIRMATIONSMYEget_GET
    extends P224PRODUCTIONCONFIRMATIONSMYEget_Event {}

class P224PRODUCTIONCONFIRMATIONSMYEget_GET2
    extends P224PRODUCTIONCONFIRMATIONSMYEget_Event {}

class P224PRODUCTIONCONFIRMATIONSMYEget_GET3
    extends P224PRODUCTIONCONFIRMATIONSMYEget_Event {}

class P224PRODUCTIONCONFIRMATIONSMYEget_FLUSH
    extends P224PRODUCTIONCONFIRMATIONSMYEget_Event {}

class P224PRODUCTIONCONFIRMATIONSMYEget_Bloc extends Bloc<
    P224PRODUCTIONCONFIRMATIONSMYEget_Event,
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>> {
  P224PRODUCTIONCONFIRMATIONSMYEget_Bloc() : super([]) {
    on<P224PRODUCTIONCONFIRMATIONSMYEget_GET>((event, emit) {
      return _P224PRODUCTIONCONFIRMATIONSMYEget_GET([], emit);
    });

    on<P224PRODUCTIONCONFIRMATIONSMYEget_GET2>((event, emit) {
      return _P224PRODUCTIONCONFIRMATIONSMYEget_GET2([], emit);
    });
    on<P224PRODUCTIONCONFIRMATIONSMYEget_GET3>((event, emit) {
      return _P224PRODUCTIONCONFIRMATIONSMYEget_GET3([], emit);
    });
    on<P224PRODUCTIONCONFIRMATIONSMYEget_FLUSH>((event, emit) {
      return _P224PRODUCTIONCONFIRMATIONSMYEget_FLUSH([], emit);
    });
  }

  Future<void> _P224PRODUCTIONCONFIRMATIONSMYEget_GET(
      List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> toAdd,
      Emitter<List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> output = [];
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> output2 = [];
    List<P224GETDETAILclass> output3 = [];
    //-------------------------------------------------------------------------------------
    FreeLoadingTan(P224PRODUCTIONCONFIRMATIONSMYEcontext);
    final response = await Dio().post(
      "${server2}03iPPGETDATACHEM/GETDATA",
      data: {
        "HEADER": {
          "PLANT": "1000",
          "ORD_ST_DATE_FR":
              "${P224PRODUCTIONCONFIRMATIONSMYEVAR.day}.${P224PRODUCTIONCONFIRMATIONSMYEVAR.month}.${P224PRODUCTIONCONFIRMATIONSMYEVAR.year}",
          "ORD_ST_DATE_TO":
              "${P224PRODUCTIONCONFIRMATIONSMYEVAR.day_next}.${P224PRODUCTIONCONFIRMATIONSMYEVAR.month_next}.${P224PRODUCTIONCONFIRMATIONSMYEVAR.year_next}",
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
          if (databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString() == '') {
            P224PRODUCTIONCONFIRMATIONSMYEgetclass buffer =
                P224PRODUCTIONCONFIRMATIONSMYEgetclass();

            buffer = (P224PRODUCTIONCONFIRMATIONSMYEgetclass(
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
              // LINK_PROC_ORDER: databuff['HEADER_INFO'][i]['LINK_PROC_ORDER']
              //             .toString() ==
              //         'Manual Create'
              //     ? databuff['HEADER_INFO'][i]['ORDER_SEQ_NO'].toString()
              //     : databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString(),
              LINK_PROC_ORDER:
                  databuff['HEADER_INFO'][i]['PROCESS_ORDER'].toString(),
            ));

            if (buffer.LINK_PROC_ORDER.length > 9) {
              // final response2 = await Dio().post(
              //   "${server2}datacentertest/getsoi8order-ro",
              //   data: {
              //     "PLANT": 'liquid',
              //     "ORDER":
              //         (ConverstStr(buffer.LINK_PROC_ORDER)).substring(4, 10),
              //     // ).toString().substring(5, 11),
              //   },
              // );
              // if (response2.statusCode == 200) {
              //   var databuff = response2.data;
              //   if (databuff.length > 0) {
              //     buffer.STATUS = 'Processing';
              //     double holddata = 0;
              //     for (var s = 0; s < databuff.length; s++) {
              //       holddata = holddata +
              //           double.parse(
              //               ConverstStr(databuff[s]['NumAct'].toString()));

              //       if (databuff[s]['StrChemical']
              //               .toString()
              //               .replaceAll(' ', '') ==
              //           'END') {
              //         buffer.STATUS = 'Complete';
              //       }
              //     }
              //     buffer.Yield = holddata.toStringAsFixed(2);
              //   }
              // }
              // print(ConverstStr(buffer.MATERIAL) +
              //     ConverstStr(buffer.LINK_PROC_ORDER));
              await Dio().post(
                // "${server3}datacentertest/getsoi8order",
                "${server2}datacentertest/getconfirm",
                //
                data: {
                  "order": ConverstStr(buffer.MATERIAL) +
                      ConverstStr(buffer.LINK_PROC_ORDER),
                },
              ).then((s) {
                var input = s.data;
                if (input.length > 0) {
                  buffer.Y2 = input[0]['weight'].toString();
                }
                if (input.length > 1) {
                  buffer.Y1 = input[1]['weight'].toString();
                }
              });
              await Dio().post(
                serverGB + "PRODUCTIONHISTORY/FREEQUERY",
                data: {
                  "query":
                      "SELECT TOP (1000) [date],[station],[weig],[code] FROM [SOI8LOG].[dbo].[kubotalog] where code like '%${buffer.BATCH.replaceAll(" ", " ")}%' order by date desc",
                },
              ).then((s) {
                // print(s.data);
                var input = s.data;
                print(input);
                double dotaout = 0;
                //PROD_SUP_DESC
                if (buffer.PROD_SUP_DESC.contains("Liq")) {
                  if (input.length > 0) {
                    for (var i = 0; i < input.length; i++) {
                      if (input[i]['weig'] != Null) {
                        if (double.parse(ConverstStr(input[i]['weig'])) > 200) {
                          dotaout = dotaout +
                              double.parse(ConverstStr(input[i]['weig']));
                        }
                      }
                    }
                  }
                }
                buffer.Yield = (dotaout / 100).toString();
              });
            }

            // try {

            // } catch (s) {}
            output.add(buffer);
          } else {
            P224PRODUCTIONCONFIRMATIONSMYEgetclass buffer =
                P224PRODUCTIONCONFIRMATIONSMYEgetclass();

            buffer = (P224PRODUCTIONCONFIRMATIONSMYEgetclass(
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

            output2.add(buffer);
          }
          P224PRODUCTIONCONFIRMATIONSMYEVAR.dataFG = output2;
          P224PRODUCTIONCONFIRMATIONSMYEVAR.dataSEMI = output;
        }
      }

      if (databuff['COMPONENT_INFO'].length > 0) {
        for (var i = 0; i < databuff['COMPONENT_INFO'].length; i++) {
          output3.add(P224GETDETAILclass(
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
        P224PRODUCTIONCONFIRMATIONSMYEVAR.dataCOMPO = output3;
      }
    } else {
      print("where is my server");
    }

    Navigator.pop(P224PRODUCTIONCONFIRMATIONSMYEcontext);

    emit(output);
  }

  Future<void> _P224PRODUCTIONCONFIRMATIONSMYEget_GET2(
      List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> toAdd,
      Emitter<List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>> emit) async {
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P224PRODUCTIONCONFIRMATIONSMYEget_GET3(
      List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> toAdd,
      Emitter<List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>> emit) async {
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P224PRODUCTIONCONFIRMATIONSMYEget_FLUSH(
      List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> toAdd,
      Emitter<List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>> emit) async {
    List<P224PRODUCTIONCONFIRMATIONSMYEgetclass> output = [];
    emit(output);
  }
}

class P224PRODUCTIONCONFIRMATIONSMYEgetclass {
  P224PRODUCTIONCONFIRMATIONSMYEgetclass({
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
    this.Yield = '',
    this.Y1 = '',
    this.Y2 = '',
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
  String Yield;

  String Y1;
  String Y2;
}

class P224GETDETAILclass {
  P224GETDETAILclass({
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
