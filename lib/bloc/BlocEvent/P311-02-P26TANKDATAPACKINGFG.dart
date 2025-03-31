import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

import '../../page/P311CHEMTANKFG/P311CHEMTANKFGVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P311TANKDATAPACKINGFG_Event {}

class P311TANKDATAPACKINGFG_GET extends P311TANKDATAPACKINGFG_Event {}

class P311TANKDATAPACKINGFG_GET2 extends P311TANKDATAPACKINGFG_Event {}

class P311TANKDATAPACKINGFG_GET3 extends P311TANKDATAPACKINGFG_Event {}

class P311TANKDATAPACKINGFG_FLUSH extends P311TANKDATAPACKINGFG_Event {}

class P311TANKDATAPACKINGFG_Bloc
    extends Bloc<P311TANKDATAPACKINGFG_Event, P311TANKDATAPACKINGFGclass> {
  P311TANKDATAPACKINGFG_Bloc() : super(P311TANKDATAPACKINGFGclass()) {
    on<P311TANKDATAPACKINGFG_GET>((event, emit) {
      return _P311TANKDATAPACKINGFG_GET(P311TANKDATAPACKINGFGclass(), emit);
    });

    on<P311TANKDATAPACKINGFG_FLUSH>((event, emit) {
      return _P311TANKDATAPACKINGFG_FLUSH(P311TANKDATAPACKINGFGclass(), emit);
    });
  }

  Future<void> _P311TANKDATAPACKINGFG_GET(P311TANKDATAPACKINGFGclass toAdd,
      Emitter<P311TANKDATAPACKINGFGclass> emit) async {
    // FreeLoadingTan(P26PROGRESSMAINcontext);
    P311TANKDATAPACKINGFGclass output = P311TANKDATAPACKINGFGclass();
    //-------------------------------------------------------------------------------------
    print(
        "-------------------------------------------------------------------------------------");
    print(P311CHEMTANKFGVAR.ORDER.substring(4, 10));
    final response3 = await Dio().post(
      "${server2}datacentertest/getsoi8order-pack-or",
      data: {
        "PLANT": P311CHEMTANKFGVAR.PLANT,
        "ORDER": P311CHEMTANKFGVAR.ORDER.substring(4, 10),
        // "PLANT": "liquid",
        // "ORDER": "227276"
      },
    );
    var input = [];
    if (response3.statusCode == 200) {
      // print(response3.statusCode);
      // print(response3.data);

      var databuff = response3.data;
      // input = databuff;
      if (databuff.length > 0) {
        output = P311TANKDATAPACKINGFGclass(
          NumOrder: savenull(databuff[0]['NumOrder']),
          NumPackSize1: savenull(databuff[0]['NumPackSize1']),
          NumQuantity1: savenull(databuff[0]['NumQuantity1']),
          NumPackSize2: savenull(databuff[0]['NumPackSize2']),
          NumQuantity2: savenull(databuff[0]['NumQuantity2']),
          NumPackSize3: savenull(databuff[0]['NumPackSize3']),
          NumQuantity3: savenull(databuff[0]['NumQuantity3']),
          NumWeight: savenull(databuff[0]['NumWeight']),
        );
      }

      // Navigator.pop(P26PROGRESSMAINcontext);

      emit(output);
    } else {
      print("where is my server");

      emit(output);
    }
  }

  Future<void> _P311TANKDATAPACKINGFG_FLUSH(P311TANKDATAPACKINGFGclass toAdd,
      Emitter<P311TANKDATAPACKINGFGclass> emit) async {
    P311TANKDATAPACKINGFGclass output = P311TANKDATAPACKINGFGclass();
    emit(output);
  }
}

//  ,[NumPackSize1]
//       ,[NumQuantity1]
//       ,[NumPackSize2]
//       ,[NumQuantity2]
//       ,[NumPackSize3]
//       ,[NumQuantity3]

class P311TANKDATAPACKINGFGclass {
  P311TANKDATAPACKINGFGclass({
    this.NumOrder = '',
    this.NumPackSize1 = '',
    this.NumQuantity1 = '',
    this.NumPackSize2 = '',
    this.NumQuantity2 = '',
    this.NumPackSize3 = '',
    this.NumQuantity3 = '',
    this.NumWeight = '',
  });

  String NumOrder;
  String NumPackSize1;
  String NumQuantity1;
  String NumPackSize2;
  String NumQuantity2;
  String NumPackSize3;
  String NumQuantity3;
  String NumWeight;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
