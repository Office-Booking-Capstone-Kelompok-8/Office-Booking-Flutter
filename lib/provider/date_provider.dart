import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime _dateStart = DateTime.now();
  DateTime _dateEnd = DateTime.now();

  get getDateStart => _dateStart;
  get getDateEnd => _dateEnd;

  set setDateStart(DateTime date) {
    _dateStart = date;
    notifyListeners();
  }

  set setDateEnd(DateTime date) {
    _dateEnd = date;
    notifyListeners();
  }
}
