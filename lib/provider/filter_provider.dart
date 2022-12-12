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
  final List<String> _listSort = [
    'Low To High',
    'High To Low',
  ];
  MyState myState = MyState.initial;
  Districts _location = Districts.none;
  final List<String> _dataButton = [
    '1-20 People',
    '20-40 People',
    '40-60 People'
  ];
  final Map<String, dynamic> _filterResult = {};
  final Map<String, dynamic> _showFilterResult = {};
  DateTime _dateStart = DateTime.now();
  String? _date;
  int? _duration;
  final TextEditingController _minCapacity = TextEditingController();
  final TextEditingController _maxCapacity = TextEditingController();
  String? _activButton;
  String _activOrder = '';

  //Gether

  List<String> get listSort => _listSort;
  String? get activButton => _activButton;
  String get activOrder => _activOrder;
  int? get duration => _duration;
  List<String> get dataButton => _dataButton;
  Map<String, dynamic> get showFilterResult => _showFilterResult;
  Map<String, dynamic> get filterResult => _filterResult;
  List<Location> get listLocation => _listLocation;
  Districts get location => _location;
  String? get hintDate => _date;
  get getDateStart => _dateStart;
  TextEditingController get minCapacity => _minCapacity;
  TextEditingController get maxCapacity => _maxCapacity;

  set setDateStart(DateTime date) {
    _dateStart = date;
    notifyListeners();
  }

  Future<void> showResult() async {
    //location
    if (_filterResult['location'] != null) {
      _showFilterResult['location'] =
          'Location ${_filterResult['location'].text}';
    }
    //capacity
    if (_filterResult['capacityMin'] != null &&
        _filterResult['capacityMax'] != null) {
      _showFilterResult['allCapacity'] =
          '${_filterResult['capacityMin']}-${_filterResult['capacityMax']} People';
    } else if (_filterResult['capacityMin'] != null) {
      _showFilterResult['capacityMin'] =
          _filterResult['capacityMin'] + ' People';
    } else if (_filterResult['capacityMax'] != null) {
      _showFilterResult['capacityMax'] =
          _filterResult['capacityMax'] + ' People';
    }
    //date
    if (_filterResult['date'] != null && _filterResult['duration'] != null) {
      _showFilterResult['date'] =
          'Date ${_filterResult['date']} ${_filterResult['duration']} Month';
    }
    //
    if (_filterResult['sortBy'] != null) {
      switch (_filterResult['sortBy']) {
        case 'annual_price':
          _showFilterResult['sortBy'] = 'Sort by Annual Price';
          break;
        case 'monthly_price':
          _showFilterResult['sortBy'] = 'Sort by Monthly Price';
          break;
        case 'capacity':
          _showFilterResult['sortBy'] = 'Sort by Capacity';
          break;
        default:
      }
    }
    //Order
    if (_filterResult['order'] != null) {
      if (_filterResult['order'] == 'asc') {
        _showFilterResult['order'] = 'Low To High';
      } else {
        _showFilterResult['order'] = 'High To Low';
      }
    }
    notifyListeners();
  }

  Future<void> removeFilter(String key) async {
    _showFilterResult.remove(key);
    if (key == 'duration' || key == 'date') {
      _filterResult.remove('duration');
      _filterResult.remove('date');
    } else if (key == 'order' || key == 'sortBy') {
      _filterResult.remove('order');
      _filterResult.remove('sortBy');
    } else if (key == 'allCapacity') {
      _filterResult.remove('capacityMin');
      _filterResult.remove('capacityMax');
    } else {
      _filterResult.remove(key);
    }
    notifyListeners();
    await getAllBuilding();
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

  clearButtonCapacity() {
    _activButton = null;
    notifyListeners();
  }

  changeSort(String sort) {
    if (sort == '' || sort.isEmpty) {
      _filterResult.remove('sortBy');
    } else {
      _filterResult['sortBy'] = sort;
      if (_activOrder == '') {
        _activOrder = 'Low To High';
        _filterResult['order'] = 'asc';
      }
    }
    notifyListeners();
  }

  changeorder(String order) {
    if (order == '' || order.isEmpty || order == _activOrder) {
      _filterResult.remove('order');
      _activOrder = '';
    } else {
      switch (order) {
        case 'Low To High':
          _activOrder = order;
          _filterResult['order'] = 'asc';
          break;
        case 'High To Low':
          _activOrder = order;
          _filterResult['order'] = 'desc';
          break;
        default:
          _activOrder = '';
          _filterResult.remove('order');
      }
    }
    notifyListeners();
  }

  changeDuration(int duration) {
    if (duration == 0) {
      _duration = null;
      _filterResult.remove('duration');
    } else {
      _duration = duration;
      _filterResult['duration'] = duration;
    }
    notifyListeners();
  }

  changeMinCapacity(String capacity) {
    if (capacity == '') {
      _filterResult.remove('capacityMin');
    } else {
      _filterResult['capacityMin'] = capacity;
    }
    notifyListeners();
  }

  changeMaxCapacity(String capacity) {
    if (capacity == '') {
      _filterResult.remove('capacityMax');
    } else {
      _filterResult['capacityMax'] = capacity;
    }

    notifyListeners();
  }

  changeCapacityButton(String capacity) {
    if (_activButton == capacity) {
      _activButton = null;
      _maxCapacity.clear();
      _minCapacity.clear();
      _filterResult.remove('capacityMax');
      _filterResult.remove('capacityMin');
    } else {
      switch (capacity) {
        case '1-20 People':
          _activButton = capacity;
          _minCapacity.text = '1';
          _maxCapacity.text = '20';
          _filterResult['capacityMax'] = '1';
          _filterResult['capacityMin'] = '20';
          break;
        case '20-40 People':
          _activButton = capacity;
          _minCapacity.text = '20';
          _maxCapacity.text = '40';
          _filterResult['capacityMax'] = '20';
          _filterResult['capacityMin'] = '40';
          break;
        case '40-60 People':
          _activButton = capacity;
          _minCapacity.text = '40';
          _maxCapacity.text = '60';
          _filterResult['capacityMax'] = '1';
          _filterResult['capacityMin'] = '20';
          break;
        default:
          _activButton = null;
          _filterResult.remove('capacityMax');
          _filterResult.remove('capacityMin');
      }
    }
    notifyListeners();
  }

  Future<void> clearState() async {
    _activButton = null;
    _activOrder = '';
    _maxCapacity.clear();
    _minCapacity.clear();
    _location = Districts.none;
    _filterResult.clear();
    _date = null;
    _showFilterResult.clear();
    notifyListeners();
  }

  clearDate() {
    _date = null;
    _filterResult.remove('date');
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
      notifyListeners();
      final response = await _service.getAllBuildings(filterResult);
      if (response != null) {
        _buildings = response;
        myState = MyState.loaded;
        notifyListeners();

        // ignore: avoid_print
        print(myState);
        return 'successfull';
      }

      myState = MyState.loaded;
      notifyListeners();
      return 'building not found';
    } catch (e) {
      if (e is DioError) {
        myState = MyState.loaded;
        notifyListeners();
        return 'Error ${e.response?.data['message'] ?? e.response?.statusCode}';
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  Future<String?> getDetail(String id) async {
    try {
      myState = MyState.loading;
      notifyListeners();
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
