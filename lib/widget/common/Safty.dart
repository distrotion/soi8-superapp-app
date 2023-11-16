String ConverstStr(String input) {
  if (isNumeric(input)) {
    return input;
  } else {
    return '0';
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String StringChecknull(dynamic input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }

  return output;
}
