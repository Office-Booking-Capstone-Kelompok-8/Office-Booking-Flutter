import 'package:intl/intl.dart';

class Helper {
  static String convertToIdr(dynamic number, int decimalDigit, bool idr) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: idr == true ? 'IDR ' : '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
