import 'dart:html';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csv/csv.dart';

import '../../model/model.dart';

import '../../page/P22GETWEIGHTLIST/P22GETWEIGHTLISTmain.dart';
import '../../page/P22GETWEIGHTLIST/P22GETWEIGHTLISTvar.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

//-------------------------------------------------

DateTime selectedDate = DateTime.now();

String server = 'http://172.23.10.34:15000/';
// String server = 'http://127.0.0.1:15150/';

abstract class GETWEIGHTLISTSGET_Event {}

class GETWEIGHTLISTSGET_GET extends GETWEIGHTLISTSGET_Event {}

class GETWEIGHTLISTSGET_flush extends GETWEIGHTLISTSGET_Event {}

class GETWEIGHTLISTSGET_Bloc
    extends Bloc<GETWEIGHTLISTSGET_Event, datauoutraw> {
  GETWEIGHTLISTSGET_Bloc() : super(datauoutraw()) {
    on<GETWEIGHTLISTSGET_GET>((event, emit) {
      return _GETWEIGHTLISTSGET_GET(datauoutraw(), emit);
    });
    on<GETWEIGHTLISTSGET_flush>((event, emit) {
      return _GETWEIGHTLISTSGET_flush(datauoutraw(), emit);
    });
  }
  Future<void> _GETWEIGHTLISTSGET_GET(
      datauoutraw toAdd, Emitter<datauoutraw> emit) async {
    List<reportCSV> data = [];

    datauoutraw output = datauoutraw();

    FreeLoading(GETWEIGHTLISTmaincontext);

    final response = await Dio().post(
      server + "getweightlist",
      data: {
        "MATNO": P22GETWEIGHTLISTvar.MATINPUT,
      },
    );

    List<String> dataname = [
      'RecordTimeStart',
      'PO',
      'MATNO',
    ];
    List<List<String>> datacsv = [];

//datadummy2
    // var input = dummydata;
    // var input = datadummy2;
    // print(input.length);
    if (response.statusCode == 200) {
      var databuff = response.data;

      if (databuff.length == 2) {
        var input = databuff['DATA'];
        var InputList = databuff['list'];
        var itemlist = InputList;

        //------------------------------------------------------NAME
        output.itemlist = [];
        output.itemobject = {};

        // output.upper = [];
        // output.data = [];
        // output.under = [];
        // output.datedata = {};

        for (var j = 0; j < itemlist.length; j++) {
          dataname.add('${itemlist[j].toString() + '_StrLotNum'}');
          dataname.add('${itemlist[j].toString() + '_StrBarcode'}');
          dataname.add('${itemlist[j].toString() + '_NumStep'}');
          dataname.add('${itemlist[j].toString() + '_NumSp'}');
          dataname.add('${itemlist[j].toString() + '_NumAct'}');
          dataname.add('${itemlist[j].toString() + '_NumTemp'}');
        }

        // //------------------------------------------------------NAME
        // //------------------------------------------------------data
        for (var i = 0; i < input.length; i++) {
          // List<String> datacsvin = [];
          List<String> datacsvin = [];
          for (var j = 0; j < dataname.length; j++) {
            if (input[i][dataname[j].toString()] != null) {
              // print(input[i][dataname[j].toString()]);
              datacsvin.add('${input[i][dataname[j].toString()]}');
            }
          }

          // if (datacsvin.length == dataname.length) {
          datacsv.add(datacsvin);
          // }
        }
        // print(datacsv);
        // print(datacsv);
        //------------------------------------------------------data
        // print(dataname.length);
        // print(datacsv.length);
        // print(datacsv);

        //------------------------------------------------------make csv
        List<dynamic> row = [];
        List<List<dynamic>> rows = [];
        for (var s = 0; s < dataname.length; s++) {
          row.add(dataname[s]);
        }

        rows.add(row);

        for (var i = 0; i < datacsv.length; i++) {
          List<dynamic> rowin = [];
          for (var j = 0; j < datacsv[i].length; j++) {
            rowin.add(datacsv[i][j]);
          }
          rows.add(rowin);
        }

        String datetada = "${selectedDate.toLocal()}".split(' ')[0];
        String csv = const ListToCsvConverter().convert(rows);
        AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
          ..setAttribute("download", "test.csv")
          ..click();
        //------------------------------------------------------make csv
      }
    }

    Navigator.pop(GETWEIGHTLISTmaincontext);

    emit(output);
  }

  Future<void> _GETWEIGHTLISTSGET_flush(
      datauoutraw toAdd, Emitter<datauoutraw> emit) async {
    datauoutraw output = datauoutraw(itemobject: {});
    emit(output);
  }
}

class datauoutraw {
  datauoutraw({
    this.itemlist = const [],
    this.itemobject = const {},

    // this.upper = const [],
    // this.data = const [],
    // this.under = const [],
    // this.datedata = const {},
  });

  Map<String, String> itemobject;
  List<String> itemlist;

  // List<FlSpot> data;
  // List<FlSpot> under;
  // Map<String, String>? datedata;
}
