// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/global.dart';
// import '../../page/P211CHEMPLANING/P211CHEMPLANINGVAR.dart';
// import '../../widget/common/Loading.dart';
// //-------------------------------------------------

// abstract class P310GETDETAIL_Event {}

// class P310GETDETAIL_GET extends P310GETDETAIL_Event {}

// class P310GETDETAIL_GET2 extends P310GETDETAIL_Event {}

// class P310GETDETAIL_GET3 extends P310GETDETAIL_Event {}

// class P310GETDETAIL_FLUSH extends P310GETDETAIL_Event {}

// class P310GETDETAIL_Bloc
//     extends Bloc<P310GETDETAIL_Event, List<P310GETDETAILclass>> {
//   P310GETDETAIL_Bloc() : super([]) {
//     on<P310GETDETAIL_GET>((event, emit) {
//       return _P310GETDETAIL_GET([], emit);
//     });

//     on<P310GETDETAIL_GET2>((event, emit) {
//       return _P310GETDETAIL_GET2([], emit);
//     });
//     on<P310GETDETAIL_GET3>((event, emit) {
//       return _P310GETDETAIL_GET3([], emit);
//     });
//     on<P310GETDETAIL_FLUSH>((event, emit) {
//       return _P310GETDETAIL_FLUSH([], emit);
//     });
//   }

//   Future<void> _P310GETDETAIL_GET(List<P310GETDETAILclass> toAdd,
//       Emitter<List<P310GETDETAILclass>> emit) async {
//     // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
//     List<P310GETDETAILclass> output = [];
//     //-------------------------------------------------------------------------------------
//     final response = await Dio().post(
//       "${server2}03iPPGETDATACHEM/GETDATA",
//       data: {
//         "HEADER": {
//           "PLANT": "1000",
//            "ORD_ST_DATE_FR":
//               "${P301QMMASTERVAR.day}.${P301QMMASTERVAR.month}.${P301QMMASTERVAR.year}",
//           "ORD_ST_DATE_TO":
//               "${P301QMMASTERVAR.day}.${P301QMMASTERVAR.month}.${P301QMMASTERVAR.year}",
//           "ORDER_TYPE": "",
//           "PROD_SUP": ""
//         },
//         "PROC_ORD": [
//           {
//             "PROCESS_ORDER": "",
//             "MATERIAL": "",
//           },
//         ],
//       },
//     );
//     var input = [];
//     // Navigator.pop(P19PROGRESSMAINcontext);
//     if (response.statusCode == 200) {
//       // print(response.statusCode);
//       // print(response.data);
//       var databuff = response.data;

//       if (databuff['COMPONENT_INFO'].length > 0) {
//         for (var i = 0; i < databuff['COMPONENT_INFO'].length; i++) {
//           if (P211CHEMPLANINGVAR.PROCESS_ORDERselect ==
//               databuff['COMPONENT_INFO'][i]['PROCESS_ORDER'].toString()) {
//             output.add(P310GETDETAILclass(
//               PROCESS_ORDER:
//                   databuff['COMPONENT_INFO'][i]['PROCESS_ORDER'].toString(),
//               ITEM: databuff['COMPONENT_INFO'][i]['ITEM'].toString(),
//               MATERIAL: databuff['COMPONENT_INFO'][i]['MATERIAL'].toString(),
//               MATERIAL_TEXT:
//                   databuff['COMPONENT_INFO'][i]['MATERIAL_TEXT'].toString(),
//               REQ_QTY: databuff['COMPONENT_INFO'][i]['REQ_QTY'].toString(),
//               UOM: databuff['COMPONENT_INFO'][i]['UOM'].toString(),
//               ITEM_CATE: databuff['COMPONENT_INFO'][i]['ITEM_CATE'].toString(),
//               NO_OF_BATCH:
//                   databuff['COMPONENT_INFO'][i]['NO_OF_BATCH'].toString(),
//               BATCH: databuff['COMPONENT_INFO'][i]['BATCH'].toString(),
//               BATCH_QTY: databuff['COMPONENT_INFO'][i]['BATCH_QTY'].toString(),
//               BATCH_UOM: databuff['COMPONENT_INFO'][i]['BATCH_UOM'].toString(),
//               STGE_LOC: databuff['COMPONENT_INFO'][i]['STGE_LOC'].toString(),
//               MVT_TYPE: databuff['COMPONENT_INFO'][i]['MVT_TYPE'].toString(),
//               OPERATION: databuff['COMPONENT_INFO'][i]['OPERATION'].toString(),
//             ));
//           }
//         }
//       }

//       // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
//     } else {
//       print("where is my server");
//     }

//     emit(output);
//   }

//   Future<void> _P310GETDETAIL_GET2(List<P310GETDETAILclass> toAdd,
//       Emitter<List<P310GETDETAILclass>> emit) async {
//     List<P310GETDETAILclass> output = [];
//     //-------------------------------------------------------------------------------------
//     List<P310GETDETAILclass> datadummy = [];

//     //-------------------------------------------------------------------------------------
//     output = datadummy;
//     emit(output);
//   }

//   Future<void> _P310GETDETAIL_GET3(List<P310GETDETAILclass> toAdd,
//       Emitter<List<P310GETDETAILclass>> emit) async {
//     List<P310GETDETAILclass> output = [];
//     //-------------------------------------------------------------------------------------
//     List<P310GETDETAILclass> datadummy = [];

//     //-------------------------------------------------------------------------------------
//     output = datadummy;
//     emit(output);
//   }

//   Future<void> _P310GETDETAIL_FLUSH(List<P310GETDETAILclass> toAdd,
//       Emitter<List<P310GETDETAILclass>> emit) async {
//     List<P310GETDETAILclass> output = [];
//     emit(output);
//   }
// }

// class P310GETDETAILclass {
//   P310GETDETAILclass({
//     this.PROCESS_ORDER = '',
//     this.ITEM = '',
//     this.MATERIAL = '',
//     this.MATERIAL_TEXT = '',
//     this.REQ_QTY = '',
//     this.UOM = '',
//     this.ITEM_CATE = '',
//     this.NO_OF_BATCH = '',
//     this.BATCH = '',
//     this.BATCH_QTY = '',
//     this.BATCH_UOM = '',
//     this.STGE_LOC = '',
//     this.MVT_TYPE = '',
//     this.OPERATION = '',
//   });

//   String PROCESS_ORDER;
//   String ITEM;
//   String MATERIAL;
//   String MATERIAL_TEXT;
//   String REQ_QTY;
//   String UOM;
//   String ITEM_CATE;
//   String NO_OF_BATCH;
//   String BATCH;
//   String BATCH_QTY;
//   String BATCH_UOM;
//   String STGE_LOC;
//   String MVT_TYPE;
//   String OPERATION;
// }

// String savenull(input) {
//   String output = '-';
//   if (input != null) {
//     output = input.toString();
//   }
//   return output;
// }
