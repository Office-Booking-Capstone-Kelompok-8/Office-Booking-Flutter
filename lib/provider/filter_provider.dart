import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/model/building/api/filter_building_api.dart';

import '../model/building/building_detail_model.dart';
import '../model/building/building_model.dart';
import '../utils/state/finite_state.dart';

enum Districts {
  none,
  southJakarta,
  northJakarta,
  westJakarta,
  centralJakarta,
  eastJakarta,
  thousandIsland
}

class Location {
  final String? id;
  final String text;
  final Districts location;
  Location({required this.text, required this.location, this.id});
}

class FilterProvider extends ChangeNotifier {
  //Filter State Property
  final List<Location> _listLocation = [
    Location(
        text: 'Central Jakarta', location: Districts.centralJakarta, id: '156'),
    Location(text: 'East Jakarta', location: Districts.eastJakarta, id: '155'),
    Location(
        text: 'North Jakarta', location: Districts.northJakarta, id: '158'),
    Location(
        text: 'South Jakarta', location: Districts.southJakarta, id: '154'),
    Location(text: 'West Jakarta', location: Districts.westJakarta, id: '157'),
    Location(
        text: 'Thousand Island', location: Districts.thousandIsland, id: '153'),
  ];
  MyState myState = MyState.initial;
  Districts _location = Districts.none;
  final List<String> _dataButton = ['40', '60', '80', '100'];
  final Map<String, dynamic> _filterResult = {};
  DateTime _dateStart = DateTime.now();
  String? _date;
  String? _duration;
  String? _minCapacity;
  String? _maxCapacity;
  String? _activButton;

  //Gether
  String? get activButton => _activButton;
  String? get duration => _duration;
  List<String> get dataButton => _dataButton;
  Map<String, dynamic> get filterResult => _filterResult;
  List<Location> get listLocation => _listLocation;
  Districts get location => _location;
  String? get hintDate => _date;
  get getDateStart => _dateStart;
  String? get minCapacity => _minCapacity;
  String? get maxCapacity => _maxCapacity;

  set setDateStart(DateTime date) {
    _dateStart = date;
    notifyListeners();
  }

  changeLocation(Location newLocation) {
    if (_location == newLocation.location) {
      _location = Districts.none;
      _filterResult.remove('location');
    } else {
      _location = newLocation.location;
      _filterResult['location'] = newLocation;
    }
    notifyListeners();
  }

  changeDuration(String duration) {
    _duration = duration;
    _filterResult['duration'] = duration;
    notifyListeners();
  }

  changeMinCapacity(String capacity) {
    _minCapacity = capacity;
    _filterResult['capacityMin'] = capacity;
    notifyListeners();
  }

  changeMaxCapacity(String capacity) {
    _maxCapacity = capacity;
    _filterResult['capacityMax'] = capacity;
    notifyListeners();
  }

  changeMaxCapacityButton(String capacity) {
    if (_activButton == capacity) {
      _activButton = null;
      _filterResult.remove('capacityMax');
    } else {
      _activButton = capacity;
      _maxCapacity = capacity;
      _filterResult['capacityMax'] = capacity;
    }
    notifyListeners();
  }

  removeFilter(String key) async {
    if (key == 'duration' || key == 'date') {
      _filterResult.remove('duration');
      _filterResult.remove('date');
    } else {
      _filterResult.remove(key);
    }
    await getAllBuilding();
    notifyListeners();
  }

  changeDate(DateTime date) {
    _filterResult['date'] = DateFormat('yyy-MM-dd').format(date);
    _date = DateFormat('yyy-MM-dd').format(date);
    notifyListeners();
  }

  //Filter Building State
  final FilterBuildingApi _service = FilterBuildingApi();
  List<BuildingModel> _buildings = [];
  BuildingDetailModel _detailBuilding = BuildingDetailModel();

  List<BuildingModel> get getBuilding => _buildings;
  BuildingDetailModel get getDetailBuilding => _detailBuilding;

  Future<String?> getAllBuilding() async {
    try {
      myState = MyState.loading;
      final response = await _service.getAllBuildings(filterResult);
      if (response != null) {
        _buildings = response;
        myState = MyState.loaded;
        notifyListeners();
        return 'successfull';
      }

      myState = MyState.loaded;
      notifyListeners();
      return 'Result Not Found, try another value';
    } catch (e) {
      if (e is DioError) {
        myState = MyState.loaded;
        notifyListeners();
        return 'Error ${e.response?.statusCode}';
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  Future<String?> getDetail(String id) async {
    try {
      myState = MyState.loading;
      final response = await _service.getBuildingDetail(id);
      _detailBuilding = response;
      myState = MyState.loaded;
      notifyListeners();
      return 'successfull';
    } catch (e) {
      if (e is DioError) {
        myState = MyState.loaded;
        notifyListeners();
        return e.response!.data['message'];
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
