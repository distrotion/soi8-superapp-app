import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P20REGISTORAP/P20REGISTORAPvar.dart';

//-------------------------------------------------
String server = serverQC;

abstract class checkregis_Event {}

class checkregis_get extends checkregis_Event {}

class checkregis_flush extends checkregis_Event {}

class checkregis_Bloc extends Bloc<checkregis_Event, List<checkregisc>> {
  checkregis_Bloc() : super([]) {
    on<checkregis_get>((event, emit) {
      return _checkregis_get([], emit);
    });
    on<checkregis_flush>((event, emit) {
      return _checkregis_flush([], emit);
    });
  }
  Future<void> _checkregis_get(
      List<checkregisc> toAdd, Emitter<List<checkregisc>> emit) async {
    List<checkregisc> output = [];

    final response = await Dio().post(
      server + "CHECKPO",
      data: {
        "PO": P20REGISTORAPvar.POINPUT,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      var inputdata = databuff['recordsets'][0];
      // print(inputdata);
      if (inputdata.length > 0) {
        //
        for (var i = 0; i < inputdata.length; i++) {
          output.add(checkregisc(
            ProcessNO: "${i + 1}",
            NumOrder:
                "${inputdata[i]['NumOrder'] != null ? inputdata[i]['NumOrder'] : ''}",
            StrBarcode:
                "${inputdata[i]['StrBarcode'] != null ? inputdata[i]['StrBarcode'] : ''}",
            StrChemical:
                "${inputdata[i]['StrChemical'] != null ? inputdata[i]['StrChemical'] : ''}",
            NumSp:
                "${inputdata[i]['NumSp'] != null ? inputdata[i]['NumSp'] : ''}",
            NumAct:
                "${inputdata[i]['NumAct'] != null ? inputdata[i]['NumAct'] : ''}",
            NumTemp:
                "${inputdata[i]['NumTemp'] != null ? inputdata[i]['NumTemp'] : ''}",
          ));
        }
      }
    }
    emit(output);
  }

  Future<void> _checkregis_flush(
      List<checkregisc> toAdd, Emitter<List<checkregisc>> emit) async {
    List<checkregisc> output = [];
    emit(output);
  }
}

class checkregisc {
  checkregisc({
    this.ProcessNO = '',
    this.NumOrder = '',
    this.StrBarcode = '',
    this.StrChemical = '',
    this.NumSp = '',
    this.NumAct = '',
    this.NumTemp = '',
  });
  String ProcessNO;
  String NumOrder;
  String StrBarcode;
  String StrChemical;

  String NumSp;
  String NumAct;
  String NumTemp;
}
