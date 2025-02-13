import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P42INCOMINGOPMAIN_Event {}

class P42INCOMINGOPMAIN_GET extends P42INCOMINGOPMAIN_Event {}

class P42INCOMINGOPMAIN_SET extends P42INCOMINGOPMAIN_Event {}

class P42INCOMINGOPMAIN_FLUSH extends P42INCOMINGOPMAIN_Event {}

class P42INCOMINGOPMAIN__Bloc
    extends Bloc<P42INCOMINGOPMAIN_Event, List<P42INCOMINGOPMAINclass>> {
  P42INCOMINGOPMAIN__Bloc() : super([]) {
    on<P42INCOMINGOPMAIN_GET>((event, emit) {
      return _P42INCOMINGOPMAIN_GET([], emit);
    });

    on<P42INCOMINGOPMAIN_SET>((event, emit) {
      return _P42INCOMINGOPMAIN_SET([], emit);
    });
    on<P42INCOMINGOPMAIN_FLUSH>((event, emit) {
      return _P42INCOMINGOPMAIN_FLUSH([], emit);
    });
  }
  Future<void> _P42INCOMINGOPMAIN_GET(List<P42INCOMINGOPMAINclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINclass>> emit) async {
    List<P42INCOMINGOPMAINclass> output = [];
    final response = await Dio().post(
      serverGB + '02DLINCOMING/GETSAP',
      data: {
        "CODE": "103",
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff.length > 0) {
        //
        for (var i = 0; i < databuff.length; i++) {
          //
          output.add(P42INCOMINGOPMAINclass(
            MAT: safenull(databuff[i]['MAT']),
            LOT: safenull(databuff[i]['LOT']),
            QTY: safenull(databuff[i]['QTY']),
            UNIT: safenull(databuff[i]['UNIT']),
            PACKET: safenull(databuff[i]['PACKET']),
            UNITSIZE: safenull(databuff[i]['UNITSIZE']),
            QTYPUNIT: safenull(databuff[i]['QTYPUNIT']),
            VDNAME: safenull(databuff[i]['VDNAME']),
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _P42INCOMINGOPMAIN_SET(List<P42INCOMINGOPMAINclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINclass>> emit) async {
    List<P42INCOMINGOPMAINclass> output = [];

    emit(output);
  }

  Future<void> _P42INCOMINGOPMAIN_FLUSH(List<P42INCOMINGOPMAINclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINclass>> emit) async {
    List<P42INCOMINGOPMAINclass> output = [];
    emit(output);
  }
}

class P42INCOMINGOPMAINclass {
  P42INCOMINGOPMAINclass({
    this.MAT = '',
    this.LOT = '',
    this.QTY = '',
    this.UNIT = '',
    this.PACKET = '',
    this.UNITSIZE = '',
    this.QTYPUNIT = '',
    this.VDNAME = '',
    this.HOLD = false,
  });

  String MAT;
  String LOT;
  String QTY;
  String UNIT;
  String PACKET;
  String UNITSIZE;
  String QTYPUNIT;
  String VDNAME;
  bool HOLD;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
