import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P40MASTERINCOMING_Event {}

class P40MASTERINCOMING_GET extends P40MASTERINCOMING_Event {}

class P40MASTERINCOMING_SET extends P40MASTERINCOMING_Event {}

class P40MASTERINCOMING_FLUSH extends P40MASTERINCOMING_Event {}

class P40MASTERINCOMING__Bloc
    extends Bloc<P40MASTERINCOMING_Event, List<P40MASTERINCOMINGclass>> {
  P40MASTERINCOMING__Bloc() : super([]) {
    on<P40MASTERINCOMING_GET>((event, emit) {
      return _P40MASTERINCOMING_GET([], emit);
    });

    on<P40MASTERINCOMING_SET>((event, emit) {
      return _P40MASTERINCOMING_SET([], emit);
    });
    on<P40MASTERINCOMING_FLUSH>((event, emit) {
      return _P40MASTERINCOMING_FLUSH([], emit);
    });
  }
  Future<void> _P40MASTERINCOMING_GET(List<P40MASTERINCOMINGclass> toAdd,
      Emitter<List<P40MASTERINCOMINGclass>> emit) async {
    List<P40MASTERINCOMINGclass> output = [];
    final response = await Dio().post(
      serverGB + '02DLINCOMING/GETMASTER',
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
          output.add(P40MASTERINCOMINGclass(
            DLITEM: safenull(databuff[i]['DLITEM']),
            ITEMS: safenull(databuff[i]['ITEMS']),
            CODE: safenull(databuff[i]['CODE']),
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _P40MASTERINCOMING_SET(List<P40MASTERINCOMINGclass> toAdd,
      Emitter<List<P40MASTERINCOMINGclass>> emit) async {
    List<P40MASTERINCOMINGclass> output = [];

    emit(output);
  }

  Future<void> _P40MASTERINCOMING_FLUSH(List<P40MASTERINCOMINGclass> toAdd,
      Emitter<List<P40MASTERINCOMINGclass>> emit) async {
    List<P40MASTERINCOMINGclass> output = [];
    emit(output);
  }
}

class P40MASTERINCOMINGclass {
  P40MASTERINCOMINGclass({
    this.DLITEM = '',
    this.ITEMS = '',
    this.CODE = '',
  });

  String DLITEM;
  String ITEMS;
  String CODE;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
