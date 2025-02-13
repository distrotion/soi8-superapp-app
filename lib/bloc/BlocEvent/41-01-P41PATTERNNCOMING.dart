import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P41PATTERNNCOMING_Event {}

class P41PATTERNNCOMING_GET extends P41PATTERNNCOMING_Event {}

class P41PATTERNNCOMING_SET extends P41PATTERNNCOMING_Event {}

class P41PATTERNNCOMING_FLUSH extends P41PATTERNNCOMING_Event {}

class P41PATTERNNCOMING__Bloc
    extends Bloc<P41PATTERNNCOMING_Event, List<P41PATTERNNCOMINGclass>> {
  P41PATTERNNCOMING__Bloc() : super([]) {
    on<P41PATTERNNCOMING_GET>((event, emit) {
      return _P41PATTERNNCOMING_GET([], emit);
    });

    on<P41PATTERNNCOMING_SET>((event, emit) {
      return _P41PATTERNNCOMING_SET([], emit);
    });
    on<P41PATTERNNCOMING_FLUSH>((event, emit) {
      return _P41PATTERNNCOMING_FLUSH([], emit);
    });
  }
  Future<void> _P41PATTERNNCOMING_GET(List<P41PATTERNNCOMINGclass> toAdd,
      Emitter<List<P41PATTERNNCOMINGclass>> emit) async {
    List<P41PATTERNNCOMINGclass> output = [];
    final response = await Dio().post(
      serverGB + '02DLINCOMING/GETPATTERN',
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

          List<P41PATTERNNCOMINGsubclass> buffer = [];

          for (var s = 0; s < databuff[i]['INCCHECKLIST'].length; s++) {
            buffer.add(P41PATTERNNCOMINGsubclass(
              DLITEM: safenull(databuff[i]['INCCHECKLIST'][s]['DLITEM']),
              ITEMS: safenull(databuff[i]['INCCHECKLIST'][s]['ITEMS']),
              TYPE: safenull(databuff[i]['INCCHECKLIST'][s]['TYPE']),
              CODE: safenull(databuff[i]['INCCHECKLIST'][s]['CODE']),
              EQ: safenull(databuff[i]['INCCHECKLIST'][s]['EQ']),
              MAX: safenull(databuff[i]['INCCHECKLIST'][s]['MAX']),
              MIN: safenull(databuff[i]['INCCHECKLIST'][s]['MIN']),
            ));
          }

          output.add(P41PATTERNNCOMINGclass(
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

  Future<void> _P41PATTERNNCOMING_SET(List<P41PATTERNNCOMINGclass> toAdd,
      Emitter<List<P41PATTERNNCOMINGclass>> emit) async {
    List<P41PATTERNNCOMINGclass> output = [];

    emit(output);
  }

  Future<void> _P41PATTERNNCOMING_FLUSH(List<P41PATTERNNCOMINGclass> toAdd,
      Emitter<List<P41PATTERNNCOMINGclass>> emit) async {
    List<P41PATTERNNCOMINGclass> output = [];
    emit(output);
  }
}

class P41PATTERNNCOMINGclass {
  P41PATTERNNCOMINGclass({
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
  List<P41PATTERNNCOMINGsubclass> INCCHECKLIST;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}

class P41PATTERNNCOMINGsubclass {
  P41PATTERNNCOMINGsubclass({
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
