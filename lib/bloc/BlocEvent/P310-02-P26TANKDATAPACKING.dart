import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

import '../../page/P310CHEMTANK/P310CHEMTANKVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------
String dec2binSigned(int decimal, {int bits = 16}) {
  if (decimal >= 0) {
    return decimal.toRadixString(2).padLeft(bits, '0');
  } else {
    // For negative numbers, compute two's complement
    int positive = -decimal;
    int inverted = (1 << bits) - 1 - positive;
    return (inverted + 1).toRadixString(2).padLeft(bits, '0');
  }
}

double binary32ToDouble(String binaryStr) {
  // Validate input
  if (binaryStr.length != 32) {
    throw ArgumentError('Input must be exactly 32 bits long');
  }
  if (!RegExp(r'^[01]+$').hasMatch(binaryStr)) {
    throw ArgumentError('Input must contain only 0s and 1s');
  }

  // Parse binary string to integer
  int intValue = int.parse(binaryStr, radix: 2);

  // Convert to bytes (big-endian)
  var bytes = ByteData(4);
  bytes.setUint32(0, intValue, Endian.big);

  // Interpret bytes as float32
  return bytes.getFloat32(0, Endian.big);
}

abstract class P26TANKDATAPACKING_Event {}

class P26TANKDATAPACKING_GET extends P26TANKDATAPACKING_Event {}

class P26TANKDATAPACKING_GET2 extends P26TANKDATAPACKING_Event {}

class P26TANKDATAPACKING_GET3 extends P26TANKDATAPACKING_Event {}

class P26TANKDATAPACKING_FLUSH extends P26TANKDATAPACKING_Event {}

class P26TANKDATAPACKING_Bloc
    extends Bloc<P26TANKDATAPACKING_Event, P26TANKDATAPACKINGclass> {
  P26TANKDATAPACKING_Bloc() : super(P26TANKDATAPACKINGclass()) {
    on<P26TANKDATAPACKING_GET>((event, emit) {
      return _P26TANKDATAPACKING_GET(P26TANKDATAPACKINGclass(), emit);
    });

    on<P26TANKDATAPACKING_FLUSH>((event, emit) {
      return _P26TANKDATAPACKING_FLUSH(P26TANKDATAPACKINGclass(), emit);
    });
  }

  Future<void> _P26TANKDATAPACKING_GET(P26TANKDATAPACKINGclass toAdd,
      Emitter<P26TANKDATAPACKINGclass> emit) async {
    // FreeLoadingTan(P26PROGRESSMAINcontext);
    P26TANKDATAPACKINGclass output = P26TANKDATAPACKINGclass();
    //-------------------------------------------------------------------------------------
    print(
        "-------------------------------------------------------------------------------------");
    print(P310CHEMTANKVAR.ORDER.substring(4, 10));
    //serverGBs
    final response3 = await Dio().post(
      // "${server2}datacentertest/getsoi8order-pack-or",
      "${serverGB}MANUALPROCESS/SAVEADDdataGET",
      data: {
        "ORDER": P310CHEMTANKVAR.ORDER.substring(4, 10),
        // "PLANT": "liquid",
        // "ORDER": "227276"
      },
    );
    var input = [];
    if (response3.statusCode == 200) {
      // print(response3.statusCode);
      // print(response3.data);

      var databuff = response3.data;
      // print(databuff);
      if (databuff.length > 0) {
        output.ORDER =
            databuff[0]['ORDER'] != null ? databuff[0]['ORDER'].toString() : "";
        output.CHEM =
            databuff[0]['CHEM'] != null ? databuff[0]['CHEM'].toString() : "";
        output.BARCODE = databuff[0]['BARCODE'] != null
            ? databuff[0]['BARCODE'].toString()
            : "";
        output.SVW =
            databuff[0]['SVW'] != null ? databuff[0]['SVW'].toString() : "";
        output.PVW =
            databuff[0]['PVW'] != null ? databuff[0]['PVW'].toString() : "";
      }

      // Navigator.pop(P26PROGRESSMAINcontext);

      // emit(output);
    } else {
      print("where is my server");

      // emit(output);
    }

    // if (P310CHEMTANKVAR.ORDER.substring(4, 10) == 'Liquid') {
    if (true) {
      //------------------->
      final response4 = await Dio().post(
        // "${server2}datacentertest/getsoi8order-pack-or",
        "${serverGBs}getsoi8data",
        data: {},
      );
      if (response4.statusCode == 200) {
        // print(response3.statusCode);
        // print(response3.data);

        var databuff = response4.data;
        // print(databuff);
        // print(P310CHEMTANKVAR.ORDER.substring(4, 10));
        if (databuff['DATA'] != null) {
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm1_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK1");
            // print("${databuff['WEIG'][0]}" "${databuff['WEIG'][1]}");
            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][1]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][0]}"));

            print(binary32ToDouble(setdata));

            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm2_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK2");
            // print("${databuff['WEIG'][2]} ${databuff['WEIG'][3]}");
            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][7]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][6]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm3_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK3");
            // print("${databuff['WEIG'][4]} ${databuff['WEIG'][5]}");
            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][11]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][10]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm4_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK4");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][17]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][16]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm5_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK6");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][21]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][20]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm6_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK7");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][27]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][26]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm7_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK8");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][31]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][30]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm8_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK9");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][37]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][36]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm9_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK10");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][41]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][40]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm10_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK11");

            String setdata =
                dec2binSigned(int.parse("${databuff['DATA2'][2]}")) +
                    dec2binSigned(int.parse("${databuff['DATA2'][1]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm11_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK12");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][47]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][46]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm12_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK13");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][51]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][50]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm13_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK14");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][61]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][60]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm14_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK15");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][67]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][66]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm15_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK16");

            String setdata =
                dec2binSigned(int.parse("${databuff['DATA2'][7]}")) +
                    dec2binSigned(int.parse("${databuff['DATA2'][6]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm16_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK17");

            String setdata =
                dec2binSigned(int.parse("${databuff['WEIG'][77]}")) +
                    dec2binSigned(int.parse("${databuff['WEIG'][76]}"));

            print(binary32ToDouble(setdata));
            output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
          }
          if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
              databuff['DATA']['pm17_order'].toString().padLeft(6, '0')) {
            print(P310CHEMTANKVAR.ORDER.substring(4, 10));
            print("TANK AT1");
          }

          if (databuff['WEIGPW'] != null) {
            if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
                databuff['DATAPW']['pm2_order'].toString().padLeft(6, '0')) {
              print(P310CHEMTANKVAR.ORDER.substring(4, 10));
              print("PW02");

              String setdata =
                  dec2binSigned(int.parse("${databuff['WEIGPW'][1]}")) +
                      dec2binSigned(int.parse("${databuff['WEIGPW'][0]}"));

              print(binary32ToDouble(setdata));
              output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
            }

            if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
                databuff['DATAPW']['pm3_order'].toString().padLeft(6, '0')) {
              print(P310CHEMTANKVAR.ORDER.substring(4, 10));
              print("PW03");

              String setdata =
                  dec2binSigned(int.parse("${databuff['WEIGPW'][3]}")) +
                      dec2binSigned(int.parse("${databuff['WEIGPW'][2]}"));

              print(binary32ToDouble(setdata));
              output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
            }

            if (P310CHEMTANKVAR.ORDER.substring(4, 10) ==
                databuff['DATAPW']['pm4_order'].toString().padLeft(6, '0')) {
              print(P310CHEMTANKVAR.ORDER.substring(4, 10));
              print("PW04");

              String setdata =
                  dec2binSigned(int.parse("${databuff['WEIGPW'][5]}")) +
                      dec2binSigned(int.parse("${databuff['WEIGPW'][4]}"));

              print(binary32ToDouble(setdata));
              output.dataw = binary32ToDouble(setdata).toStringAsFixed(0);
            }
          }
        }
      }
    }
    emit(output);
  }

  Future<void> _P26TANKDATAPACKING_FLUSH(P26TANKDATAPACKINGclass toAdd,
      Emitter<P26TANKDATAPACKINGclass> emit) async {
    P26TANKDATAPACKINGclass output = P26TANKDATAPACKINGclass();
    emit(output);
  }
}

//  ,[NumPackSize1]
//       ,[NumQuantity1]
//       ,[NumPackSize2]
//       ,[NumQuantity2]
//       ,[NumPackSize3]
//       ,[NumQuantity3]

class P26TANKDATAPACKINGclass {
  P26TANKDATAPACKINGclass({
    this.ORDER = '',
    this.CHEM = '',
    this.BARCODE = '',
    this.SVW = '',
    this.PVW = '',
    this.dataw = '',
  });

  String ORDER;
  String CHEM;
  String BARCODE;
  String SVW;
  String PVW;

  String dataw;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toStringAsFixed(0);
  }
  return output;
}
