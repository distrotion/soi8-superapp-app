class P23GETWEIGHTLISTBYTANKvar {
  //
  static bool isMATINPUT = false;
  static bool ischeck = false;
  static int canregis = 0;
  static String TANKNAME = '';
  static String COMMENT = '';

  static String startDATE = '';
  static List<String> startDATElist = [];
  static dateout startDATEout = dateout();
  static String endDATE = '';
  static List<String> endDATElist = [];
  static dateout endDATEout = dateout();

  //COMMENT
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
