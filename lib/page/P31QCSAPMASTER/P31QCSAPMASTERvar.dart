class P31QCSAPMASTERvar {
  static bool iscontrol = false;
  static String SEARCH = '';
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

  static String MKMNR = '';
  static String SETTOSAP = '-';
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
