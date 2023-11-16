import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';

import '../../data/global.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
// String server = 'http://127.0.0.1:15000/';
String server = serverGB;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
late Future<String> tokenSP;

abstract class LoginEvent {}

class LoginPage extends LoginEvent {}

class ReLogin extends LoginEvent {}

class Logout extends LoginEvent {}

class Login_Bloc extends Bloc<LoginEvent, String> {
  Login_Bloc() : super('') {
    on<LoginPage>((event, emit) {
      return _LoginPage_Function(state, emit);
    });
    on<ReLogin>((event, emit) {
      return _ReLogin_Function(state, emit);
    });
    on<Logout>((event, emit) {
      return _Logout_Function(state, emit);
    });
  }

  Future<void> _LoginPage_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    // token = (prefs.getString('token') ?? '');
    final response = await Dio().post(
      server + "login",
      data: {
        "ID": logindata.userID,
        "PASS": logindata.userPASS,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff['return'] == 'OK') {
        token =
            '{"ID":"${databuff['ID'].toString()}","NAME":"${databuff['NAME'].toString()}","LV":"${databuff['LV'].toString()}","Section":"${databuff['Section'].toString()}","Def":"${databuff['Def'].toString()}"  ,"PD":"${databuff['PD'].toString()}","QC":"${databuff['QC'].toString()}","MFT":"${databuff['MFT'].toString()}","RM":"${databuff['RM'].toString()}","DL":"${databuff['DL'].toString()}"}';
        USERDATA.ID = databuff['ID'].toString();
        USERDATA.NAME = databuff['NAME'].toString();
        USERDATA.UserLV = int.parse(databuff['LV'].toString());
        USERDATA.Section = databuff['Section'].toString();
        USERDATA.Def = databuff['Def'].toString();

        USERDATA.PD = databuff['PD'].toString();
        USERDATA.QC = databuff['QC'].toString();
        USERDATA.MFT = databuff['MFT'].toString();
        USERDATA.RM = databuff['RM'].toString();
        USERDATA.DL = databuff['DL'].toString();
      } else {
        token = (prefs.getString('tokenSP') ?? '');
        USERDATA.UserLV = 0;
      }
    } else {
      token = (prefs.getString('tokenSP') ?? '');
      USERDATA.UserLV = 0;
    }

    tokenSP = prefs.setString("tokenSP", token).then((bool success) {
      return state;
    });

    if (token != '') {
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Success", "Login OK", enumNotificationlist.Success);
    } else {
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification("Error",
          "user or password have some problem", enumNotificationlist.Error);
    }

    // BlocProvider.of<Notification_Bloc>(contextGB)
    //   .UpdateNotification("", "Login OK", enumNotificationlist.Success);

    emit(token);
  }

  Future<void> _ReLogin_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    token = (prefs.getString('tokenSP') ?? '');

    if (token != '') {
      var databuff = jsonDecode(token);
      USERDATA.ID = databuff['ID'].toString();
      USERDATA.UserLV = int.parse(databuff['LV'].toString());
      USERDATA.NAME = databuff['NAME'].toString();
      USERDATA.Section = databuff['Section'].toString();
      USERDATA.Def = databuff['Def'].toString();

      USERDATA.PD = databuff['PD'].toString();
      USERDATA.QC = databuff['QC'].toString();
      USERDATA.MFT = databuff['MFT'].toString();
      USERDATA.RM = databuff['RM'].toString();
      USERDATA.DL = databuff['DL'].toString();
    } else {
      USERDATA.ID = '';
      USERDATA.UserLV = 0;
      USERDATA.NAME = '';
    }

    emit(token);
  }

  Future<void> _Logout_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    token = '';
    USERDATA.UserLV = 0;
    USERDATA.NAME = '';

    tokenSP = prefs.setString("tokenSP", token).then((bool success) {
      return state;
    });

    if (token == '') {
      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("", "Logout", enumNotificationlist.Success);
    }

    emit('');
  }
}
