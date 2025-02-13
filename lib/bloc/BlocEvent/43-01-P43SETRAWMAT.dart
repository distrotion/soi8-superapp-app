import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P43SETRAWMAT/P43SETRAWMATVAR.dart';

//-------------------------------------------------

abstract class P43SETRAWMATMAIN_Event {}

class P43SETRAWMATMAIN_GET extends P43SETRAWMATMAIN_Event {}

class P43SETRAWMATMAIN_SET extends P43SETRAWMATMAIN_Event {}

class P43SETRAWMATMAIN_FLUSH extends P43SETRAWMATMAIN_Event {}

class P43SETRAWMATMAIN__Bloc
    extends Bloc<P43SETRAWMATMAIN_Event, List<P43SETRAWMATMAINclass>> {
  P43SETRAWMATMAIN__Bloc() : super([]) {
    on<P43SETRAWMATMAIN_GET>((event, emit) {
      return _P43SETRAWMATMAIN_GET([], emit);
    });

    on<P43SETRAWMATMAIN_SET>((event, emit) {
      return _P43SETRAWMATMAIN_SET([], emit);
    });
    on<P43SETRAWMATMAIN_FLUSH>((event, emit) {
      return _P43SETRAWMATMAIN_FLUSH([], emit);
    });
  }
  Future<void> _P43SETRAWMATMAIN_GET(List<P43SETRAWMATMAINclass> toAdd,
      Emitter<List<P43SETRAWMATMAINclass>> emit) async {
    List<P43SETRAWMATMAINclass> output = [];
    final response = await Dio().post(
      serverGB + 'MANUALPROCESS/selecfml',
      data: {
        "MAT": P43SETRAWMATVAR.MAT,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff.length > 0) {
        //
        for (var i = 0; i < databuff.length; i++) {
          //
          print(databuff[i]['Chm']);
          output.add(P43SETRAWMATMAINclass(
            Fml: safenull(databuff[i]['Fml']),
            Chm: safenull(databuff[i]['Chm']),
            Bc: safenull(databuff[i]['Bc']),
            W: safenull(databuff[i]['W']),
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _P43SETRAWMATMAIN_SET(List<P43SETRAWMATMAINclass> toAdd,
      Emitter<List<P43SETRAWMATMAINclass>> emit) async {
    List<P43SETRAWMATMAINclass> output = [];

    emit(output);
  }

  Future<void> _P43SETRAWMATMAIN_FLUSH(List<P43SETRAWMATMAINclass> toAdd,
      Emitter<List<P43SETRAWMATMAINclass>> emit) async {
    List<P43SETRAWMATMAINclass> output = [];
    emit(output);
  }
}

class P43SETRAWMATMAINclass {
  P43SETRAWMATMAINclass({
    this.Bc = '',
    this.Fml = '',
    this.Chm = '',
    this.W = '',
  });

  String Bc;
  String Fml;
  String Chm;
  String W;
}

String safenull(var input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
