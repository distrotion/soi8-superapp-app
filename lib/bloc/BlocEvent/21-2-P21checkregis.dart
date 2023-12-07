import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P20REGISTORAP/P20REGISTORAPvar.dart';

//-------------------------------------------------
String server = serverQC;

abstract class P31checkregis_Event {}

class P31checkregis_get extends P31checkregis_Event {}

class P31checkregis_flush extends P31checkregis_Event {}

class P31checkregis_Bloc
    extends Bloc<P31checkregis_Event, List<P31checkregisc>> {
  P31checkregis_Bloc() : super([]) {
    on<P31checkregis_get>((event, emit) {
      return _P31checkregis_get([], emit);
    });
    on<P31checkregis_flush>((event, emit) {
      return _P31checkregis_flush([], emit);
    });
  }
  Future<void> _P31checkregis_get(
      List<P31checkregisc> toAdd, Emitter<List<P31checkregisc>> emit) async {
    List<P31checkregisc> output = [];

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
          output.add(P31checkregisc(
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

  Future<void> _P31checkregis_flush(
      List<P31checkregisc> toAdd, Emitter<List<P31checkregisc>> emit) async {
    List<P31checkregisc> output = [];
    emit(output);
  }
}

class P31checkregisc {
  P31checkregisc({
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
