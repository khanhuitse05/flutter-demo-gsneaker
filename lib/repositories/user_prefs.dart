import 'dart:convert';

import 'package:app/model/shoes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _keys {
  static const String shoesList = 'shoes-list';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //
  List<Shoes> getShoesList() {
    final value = _prefs.getString(_keys.shoesList) ?? '';
    if (value.isNotEmpty) {
      try {
        List<Shoes> list =
            (json.decode(value) as List).map((i) => Shoes.fromJson(i)).toList();
        return list.cast<Shoes>();
      } catch (_) {}
    }
    return [];
  }

  void setShoesList(List<Shoes>? value) {
    String json = jsonEncode(value ?? []);
    _prefs.setString(_keys.shoesList, json);
  }
}
