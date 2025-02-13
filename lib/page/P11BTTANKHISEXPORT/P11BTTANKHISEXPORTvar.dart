class P11BTTANKHISEXPORTvar {
  static bool iscontrol = false;
  static String MAX = '1000';
  static String startDATE = '';
  static List<String> startDATElist = [];
  static dateout startDATEout = dateout();
  static String endDATE = '';
  static List<String> endDATElist = [];
  static dateout endDATEout = dateout();
  static int FPint = 0;
  static int LPint = 0;
  static int pagelist = 0;
  static int pageselect = 0;
}

class dateout {
  dateout({
    this.year = '',
    this.month = '',
    this.day = '',
  });

  String year;
  String month;
  String day;
}

class P11SumReportvar {
  static bool iscon01 = false;
  static String MAT = '';
  static String startDATE = '';
  static List<String> startDATElist = [];
  static dateout startDATEout = dateout();
  static String endDATE = '';
  static List<String> endDATElist = [];
  static dateout endDATEout = dateout();
}
