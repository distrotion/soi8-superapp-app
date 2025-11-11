import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

import '../../page/P311CHEMTANKFG/P311CHEMTANKFGMAIN.dart';
import '../../page/P311CHEMTANKFG/P311CHEMTANKFGVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P311CHEMTANKGETFGDATA_Event {}

class P311CHEMTANKGETFGDATA_GET extends P311CHEMTANKGETFGDATA_Event {}

class P311CHEMTANKGETFGDATA_GET2 extends P311CHEMTANKGETFGDATA_Event {}

class P311CHEMTANKGETFGDATA_GET3 extends P311CHEMTANKGETFGDATA_Event {}

class P311CHEMTANKGETFGDATA_FLUSH extends P311CHEMTANKGETFGDATA_Event {}

class P311CHEMTANKGETFGDATA_Bloc extends Bloc<P311CHEMTANKGETFGDATA_Event,
    List<P311CHEMTANKGETFGDATAclass>> {
  P311CHEMTANKGETFGDATA_Bloc() : super([]) {
    on<P311CHEMTANKGETFGDATA_GET>((event, emit) {
      return _P311CHEMTANKGETFGDATA_GET([], emit);
    });

    on<P311CHEMTANKGETFGDATA_GET2>((event, emit) {
      return _P311CHEMTANKGETFGDATA_GET2([], emit);
    });
    on<P311CHEMTANKGETFGDATA_GET3>((event, emit) {
      return _P311CHEMTANKGETFGDATA_GET3([], emit);
    });
    on<P311CHEMTANKGETFGDATA_FLUSH>((event, emit) {
      return _P311CHEMTANKGETFGDATA_FLUSH([], emit);
    });
  }

  Future<void> _P311CHEMTANKGETFGDATA_GET(
      List<P311CHEMTANKGETFGDATAclass> toAdd,
      Emitter<List<P311CHEMTANKGETFGDATAclass>> emit) async {
    FreeLoadingTan(P311CHEMTANKFGcontext);
    List<P311CHEMTANKGETFGDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    //P310CHEMTANKVAR.Fml
    final response = await Dio().post(
      // "${server3}datacentertest/getsoi8order",
      "${server2}datacentertest/getsoi8order-ro",
      //
      data: {
        "PLANT": P311CHEMTANKFGVAR.PLANT,
        "ORDER": P311CHEMTANKFGVAR.ORDER.substring(4, 10),
        // "PLANT": "liquid",
        // "ORDER": "227276"
      },
    );

    var input = [];
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(response.data);
      var databuff = response.data;
      input = databuff;

      List<P311CHEMTANKGETFGDATAclass> outputdata = input
          .where((dataActual) =>
              dataActual['StrChemical'] != 'END' &&
              dataActual['StrBarcode'] != 'END')
          .map((dataActual) {
        return P311CHEMTANKGETFGDATAclass(
          ID: savenull(dataActual['ID']),
          TIMESTART: savenull(dataActual['RecordTimeStart']),
          ORDER: savenull(dataActual['NumOrder']),
          TANK: savenull(dataActual['NumTank']),
          NUMMODE: savenull(dataActual['NumMode']),
          CHEMICALNAME: savenull(dataActual['StrChemical']),
          LOT: savenull(dataActual['StrLotNum']),
          BARCODE: savenull(dataActual['StrBarcode']),
          NUMMODEOPER: savenull(dataActual['NumModeOper']),
          STEP: savenull(dataActual['NumStep']),
          SP: savenull(dataActual['NumSp']),
          ACTUAL: savenull(dataActual['NumAct']),
          TEMP: savenull(dataActual['NumTemp']),
          DTDATE: savenull(dataActual['dtDate']),
        );
      }).toList();
      Navigator.pop(P311CHEMTANKFGcontext);

      output = outputdata;
    } else {
      print("where is my server");
      output = [];
    }
    emit(output);
  }

  Future<void> _P311CHEMTANKGETFGDATA_GET2(
      List<P311CHEMTANKGETFGDATAclass> toAdd,
      Emitter<List<P311CHEMTANKGETFGDATAclass>> emit) async {
    List<P311CHEMTANKGETFGDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P311CHEMTANKGETFGDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P311CHEMTANKGETFGDATA_GET3(
      List<P311CHEMTANKGETFGDATAclass> toAdd,
      Emitter<List<P311CHEMTANKGETFGDATAclass>> emit) async {
    List<P311CHEMTANKGETFGDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P311CHEMTANKGETFGDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P311CHEMTANKGETFGDATA_FLUSH(
      List<P311CHEMTANKGETFGDATAclass> toAdd,
      Emitter<List<P311CHEMTANKGETFGDATAclass>> emit) async {
    List<P311CHEMTANKGETFGDATAclass> output = [];
    emit(output);
  }
}

class P311CHEMTANKGETFGDATAclass {
  P311CHEMTANKGETFGDATAclass({
    this.ID = '',
    this.TIMESTART = '',
    this.ORDER = '',
    this.TANK = '',
    this.NUMMODE = '',
    this.CHEMICALNAME = '',
    this.LOT = '',
    this.BARCODE = '',
    this.NUMMODEOPER = '',
    this.STEP = '',
    this.SP = '',
    this.ACTUAL = '',
    this.TEMP = '',
    this.DTDATE = '',
  });

  String ID;
  String TIMESTART;
  String ORDER;
  String TANK;
  String NUMMODE;
  String CHEMICALNAME;
  String LOT;
  String BARCODE;
  String NUMMODEOPER;
  String STEP;
  String SP;
  String ACTUAL;
  String TEMP;
  String DTDATE;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
