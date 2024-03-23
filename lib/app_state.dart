import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _asvAppVersion = prefs.getString('ff_asvAppVersion') ?? _asvAppVersion;
    });
    _safeInit(() {
      _asvAppBuild = prefs.getString('ff_asvAppBuild') ?? _asvAppBuild;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  String _apiKey = 'AIzaSyCP2wcyxMmCkxz4G1dDs2ber4e3MN1LgPA';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    prefs.setString('ff_apiKey', value);
  }

  String _asvAppVersion = '1.0.0';
  String get asvAppVersion => _asvAppVersion;
  set asvAppVersion(String value) {
    _asvAppVersion = value;
    prefs.setString('ff_asvAppVersion', value);
  }

  String _asvAppBuild = '6';
  String get asvAppBuild => _asvAppBuild;
  set asvAppBuild(String value) {
    _asvAppBuild = value;
    prefs.setString('ff_asvAppBuild', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
