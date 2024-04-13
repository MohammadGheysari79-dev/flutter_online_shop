class StringUtils {
  static String priceType(String str) {
    str = _reverse(str);
    str = _addComma(str);
    str = _reverse(str);
    return str;
  }

  static String _reverse(String str) {
    String revers = '';
    for (int i = str.length - 1; i >= 0; i--) {
      revers += str[i];
    }
    return revers;
  }

  static String _addComma(String str) {
    String res = '';
    for (int i = 0; i < str.length; i++) {
      res += str[i];
      if ((i + 1) % 3 == 0) {
        res += ',';
      }
    }
    return res;
  }
}
