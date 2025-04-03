import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tpk_login_v2/widget/common/Safty.dart';

import '../../data/global.dart';
import '../../page/P43SETRAWMAT/P43SETRAWMATVAR.dart';
import '../../page/P60PRCESSMANUAL/P60PRCESSMANUALVAR.dart';

//-------------------------------------------------

abstract class SETRAWMATMAIN_Event {}

class SETRAWMATMAIN_GET extends SETRAWMATMAIN_Event {}

class SETRAWMATMAIN_SET extends SETRAWMATMAIN_Event {}

class SETRAWMATMAIN_FLUSH extends SETRAWMATMAIN_Event {}

class SETRAWMATMAIN__Bloc
    extends Bloc<SETRAWMATMAIN_Event, List<SETRAWMATMAINclass>> {
  SETRAWMATMAIN__Bloc() : super([]) {
    on<SETRAWMATMAIN_GET>((event, emit) {
      return _SETRAWMATMAIN_GET([], emit);
    });

    on<SETRAWMATMAIN_SET>((event, emit) {
      return _SETRAWMATMAIN_SET([], emit);
    });
    on<SETRAWMATMAIN_FLUSH>((event, emit) {
      return _SETRAWMATMAIN_FLUSH([], emit);
    });
  }
  Future<void> _SETRAWMATMAIN_GET(List<SETRAWMATMAINclass> toAdd,
      Emitter<List<SETRAWMATMAINclass>> emit) async {
    List<SETRAWMATMAINclass> output = [];
    // final response = await Dio().post(
    //   serverGB + 'MANUALPROCESS/selecfml',
    //   data: {
    //     "MAT": P60PRCESSMANUALVAR.MAT,
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    //   print(databuff);
    //   if (databuff.length > 0) {
    //     //
    //     for (var i = 0; i < databuff.length; i++) {
    //       //
    //       print(databuff[i]['Chm']);
    //       output.add(SETRAWMATMAINclass(
    //         Fml: safenull(databuff[i]['Fml']),
    //         Chm: safenull(databuff[i]['Chm']),
    //         Bc: safenull(databuff[i]['Bc']),
    //         PW: safenull(databuff[i]['W']),
    //       ));
    //     }
    //   }
    // } else {
    //   //
    // }
    emit(output);
  }

  Future<void> _SETRAWMATMAIN_SET(List<SETRAWMATMAINclass> toAdd,
      Emitter<List<SETRAWMATMAINclass>> emit) async {
    List<SETRAWMATMAINclass> output = [];

    List<Map<String, String>> datauotsave = [];

    for (var i = 0; i < P60PRCESSMANUALVAR.LISTSAVE.length; i++) {
      datauotsave.add({
        "NumOrder": P60PRCESSMANUALVAR.ORDER.substring(12, 18),
        "StrChemical": P60PRCESSMANUALVAR.LISTSAVE[i].Chm,
        "StrLotNum": P60PRCESSMANUALVAR.LISTSAVE[i].LOT,
        "StrBarcode": "",
        "NumStep": "${i + 1}",
        "NumSp": ConverstStr(P60PRCESSMANUALVAR.LISTSAVE[i].PW),
        "NumAct": ConverstStr(P60PRCESSMANUALVAR.LISTSAVE[i].W),
      });
    }
    //

    if (datauotsave.isNotEmpty) {
      datauotsave.add({
        "NumOrder": P60PRCESSMANUALVAR.ORDER.substring(12, 18),
        "StrChemical": "END",
        "StrLotNum": "RTM",
        "StrBarcode": "END",
        "NumStep": "${datauotsave.length + 1}",
        "NumSp": "0",
        "NumAct": "0",
      });
    }

    final response = await Dio().post(
      serverGB + 'MANUALPROCESS/SAVEdata',
      data: {"DATA": datauotsave},
    );

    // emit(output);
  }

  Future<void> _SETRAWMATMAIN_FLUSH(List<SETRAWMATMAINclass> toAdd,
      Emitter<List<SETRAWMATMAINclass>> emit) async {
    List<SETRAWMATMAINclass> output = [];
    emit(output);
  }
}

class SETRAWMATMAINclass {
  SETRAWMATMAINclass({
    this.Bc = '',
    this.Fml = '',
    this.Chm = '',
    this.PW = '',
    this.W = '',
    this.LOT = '',
    this.SubW = '',
    this.SubLOT = '',
  });

  String Bc;
  String Fml;
  String Chm;
  String PW;
  String W;
  String LOT;
  String SubW;
  String SubLOT;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
