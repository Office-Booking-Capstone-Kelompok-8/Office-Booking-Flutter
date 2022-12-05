import 'package:flutter/material.dart';

class SetStateProvider extends ChangeNotifier {
  DateTime _dateStart = DateTime.now();
  DateTime _dateEnd = DateTime.now();
  int? _number = 0;

  get getDateStart => _dateStart;
  get getDateEnd => _dateEnd;
  int? get number => _number;

  set setDateStart(DateTime date) {
    _dateStart = date;
    notifyListeners();
  }

  set setDateEnd(DateTime date) {
    _dateEnd = date;
    notifyListeners();
  }

  set number(int? value) {
    _number = value;
    notifyListeners();
  }
}
