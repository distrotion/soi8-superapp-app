import 'package:flutter/material.dart';
import '../page/page0.dart';

String token = '';
Widget CuPage = const Page0();
int CuPageLV = 0;
String plantcre = '';

class USERDATA {
  static int UserLV = 0;
  static String NAME = '';
  static String ID = '';
  static String Section = '';
  static String Def = '';

  static String PD = '';
  static String QC = '';
  static String QA = '';
  static String MFT = '';
  static String RM = '';
  static String DL = '';
}

class logindata {
  static bool isControl = false;
  static String userID = '';
  static String userPASS = '';
}

class valueinput {
  static String poid = '';
  static String plant = '';
  static int textorvalue = 0;
  static bool isbool = false;
  static String item = '';
  static String value = '';
}

class ACCEPTION {
  static String poid = '';
  static String plant = '';
}

class dropdown01 {
  static List<String> CO = [''];
  static List<String> AP = [''];
  static List<String> checklist = [''];
  static List<String> PREMIX = [''];
  static List<String> COILCOATING = [''];
  static List<String> HYDROPHILIC = [''];
  static List<String> PLX = [''];
  static List<String> TRITRATING = [''];
  static List<String> POWDER = [''];
  static List<String> LIQUID = [''];
}

class GETONE {
  static String poid = '';
  static String plant = '';
  static bool isbool = false;
}

// String serverINV = 'http://127.0.0.1:18010/';
// String serverQC = 'http://127.0.0.1:15000/';
// String serverGB = 'http://127.0.0.1:18000/';
// String server2 = 'http://127.0.0.1:14094/';
//
String serverGB = 'http://172.23.10.34:18000/';
String serverQC = 'http://172.23.10.34:15000/';
String serverINV = 'http://172.23.10.34:18010/';
String server2 = 'http://172.23.10.168:14094/';
// String server2 = 'http://127.0.0.1:14094/';

String serverGBs = 'http://172.23.10.34:2500/';

//120008341010216885
