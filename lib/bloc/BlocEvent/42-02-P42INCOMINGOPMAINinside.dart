import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P42INCOMINGOP/P42INCOMINGOPVAR.dart';

//-------------------------------------------------

abstract class P42INCOMINGOPMAINinside_Event {}

class P42INCOMINGOPMAINinside_GET extends P42INCOMINGOPMAINinside_Event {}

class P42INCOMINGOPMAINinside_SET extends P42INCOMINGOPMAINinside_Event {}

class P42INCOMINGOPMAINinside_FLUSH extends P42INCOMINGOPMAINinside_Event {}

class P42INCOMINGOPMAINinside__Bloc extends Bloc<P42INCOMINGOPMAINinside_Event,
    List<P42INCOMINGOPMAINinsideclass>> {
  P42INCOMINGOPMAINinside__Bloc() : super([]) {
    on<P42INCOMINGOPMAINinside_GET>((event, emit) {
      return _P42INCOMINGOPMAINinside_GET([], emit);
    });

    on<P42INCOMINGOPMAINinside_SET>((event, emit) {
      return _P42INCOMINGOPMAINinside_SET([], emit);
    });
    on<P42INCOMINGOPMAINinside_FLUSH>((event, emit) {
      return _P42INCOMINGOPMAINinside_FLUSH([], emit);
    });
  }
  Future<void> _P42INCOMINGOPMAINinside_GET(
      List<P42INCOMINGOPMAINinsideclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINinsideclass>> emit) async {
    List<P42INCOMINGOPMAINinsideclass> output = [];
    final response = await Dio().post(
      serverGB + '02DLINCOMING/GETSAPsycMAT',
      data: {
        "MAT": P42INCOMINGOPVAR.MAT,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff.length > 0) {
        //
        for (var i = 0; i < databuff.length; i++) {
          //

          List<P42INCOMINGOPMAINinsidesubclass> buffer = [];

          for (var s = 0; s < databuff[i]['INCCHECKLIST'].length; s++) {
            buffer.add(P42INCOMINGOPMAINinsidesubclass(
              DLITEM: safenull(databuff[i]['INCCHECKLIST'][s]['DLITEM']),
              ITEMS: safenull(databuff[i]['INCCHECKLIST'][s]['ITEMS']),
              TYPE: safenull(databuff[i]['INCCHECKLIST'][s]['TYPE']),
              CODE: safenull(databuff[i]['INCCHECKLIST'][s]['CODE']),
              EQ: safenull(databuff[i]['INCCHECKLIST'][s]['EQ']),
              MAX: safenull(databuff[i]['INCCHECKLIST'][s]['MAX']),
              MIN: safenull(databuff[i]['INCCHECKLIST'][s]['MIN']),
            ));
          }

          output.add(P42INCOMINGOPMAINinsideclass(
            DLPATTERN: safenull(databuff[i]['DLITEM']),
            NAME: safenull(databuff[i]['NAME']),
            CODE: safenull(databuff[i]['CODE']),
            MAT: safenull(databuff[i]['MAT']),
            INCCHECKLIST: buffer,
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _P42INCOMINGOPMAINinside_SET(
      List<P42INCOMINGOPMAINinsideclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINinsideclass>> emit) async {
    List<P42INCOMINGOPMAINinsideclass> output = [];

    emit(output);
  }

  Future<void> _P42INCOMINGOPMAINinside_FLUSH(
      List<P42INCOMINGOPMAINinsideclass> toAdd,
      Emitter<List<P42INCOMINGOPMAINinsideclass>> emit) async {
    List<P42INCOMINGOPMAINinsideclass> output = [];
    emit(output);
  }
}

class P42INCOMINGOPMAINinsideclass {
  P42INCOMINGOPMAINinsideclass({
    this.DLPATTERN = '',
    this.NAME = '',
    this.CODE = '',
    this.MAT = '',
    this.INCCHECKLIST = const [],
  });

  String DLPATTERN;
  String NAME;
  String CODE;
  String MAT;
  List<P42INCOMINGOPMAINinsidesubclass> INCCHECKLIST;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}

class P42INCOMINGOPMAINinsidesubclass {
  P42INCOMINGOPMAINinsidesubclass({
    this.DLITEM = '',
    this.ITEMS = '',
    this.TYPE = '',
    this.CODE = '',
    this.EQ = '',
    this.MAX = '',
    this.MIN = '',
  });

  String DLITEM;
  String ITEMS;
  String TYPE;
  String CODE;
  String EQ;
  String MAX;
  String MIN;
}
