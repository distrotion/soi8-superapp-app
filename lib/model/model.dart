class DATABODY {
  DATABODY({
    this.str = '',
    this.inte = 0,
    this.bools = false,
  });
  String str;
  int inte;
  bool bools;
}

class reportCSV {
  reportCSV({
    this.PO = '',
    this.CP = '',
    this.F01 = '',
    this.F02 = '',
    this.F03 = '',
    this.F04 = '',
    this.F05 = '',
    this.F06 = '',
    this.F07 = '',
    this.F08 = '',
    this.F09 = '',
    this.F10 = '',
    this.F11 = '',
    this.F12 = '',
    this.F13 = '',
    this.F14 = '',
    this.F15 = '',
    this.F16 = '',
    this.F17 = '',
    this.F18 = '',
    this.F19 = '',
    this.F20 = '',
    this.F21 = '',
    this.F22 = '',
    this.F23 = '',
    this.F24 = '',
    this.F25 = '',
    this.F26 = '',
    this.F27 = '',
    this.F28 = '',
    this.F29 = '',
    this.F30 = '',
  });

  String PO;
  String CP;
  String F01;
  String F02;
  String F03;
  String F04;
  String F05;
  String F06;
  String F07;
  String F08;
  String F09;
  String F10;
  String F11;
  String F12;
  String F13;
  String F14;
  String F15;
  String F16;
  String F17;
  String F18;
  String F19;
  String F20;
  String F21;
  String F22;
  String F23;
  String F24;
  String F25;
  String F26;
  String F27;
  String F28;
  String F29;
  String F30;
}

class dataoutCSV {
  dataoutCSV({
    this.name = '',
    required this.data,
  });
  String name;
  List<reportCSV> data;
}
