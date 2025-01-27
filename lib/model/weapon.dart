// Copyright (c) 2022 Jan Stehno

import 'dart:ui';
import 'package:cotwcompanion/miscellaneous/helpers/json.dart';
import 'package:cotwcompanion/miscellaneous/types.dart';
import 'package:cotwcompanion/model/ammo.dart';
import 'package:easy_localization/easy_localization.dart';

class Weapon {
  final int _id;
  String _name;
  final String _en, _ru, _cs, _pl, _de, _fr, _es, _pt, _ja;
  final WeaponType _type;
  final int _mag;
  int _min, _max;
  final List<dynamic> _ammo = [];
  final int _dlc;

  Weapon({
    required id,
    required name,
    required en,
    required ru,
    required cs,
    required pl,
    required de,
    required fr,
    required es,
    required pt,
    required ja,
    required type,
    required mag,
    required min,
    required max,
    required ammo,
    required dlc,
  })  : _id = id,
        _name = name,
        _en = en,
        _ru = ru,
        _cs = cs,
        _pl = pl,
        _de = de,
        _fr = fr,
        _es = es,
        _pt = pt,
        _ja = ja,
        _type = type,
        _mag = mag,
        _min = min,
        _max = max,
        _dlc = dlc;

  int get id => _id;

  WeaponType get type => _type;

  int get mag => _mag;

  int get min => _min;

  int get max => _max;

  List<dynamic> get ammo => _ammo;

  int get dlc => _dlc;

  bool get isFromDlc => _dlc == 1;

  int get getMaxPenetration {
    int max = 0;
    for (int index in _ammo) {
      int pen = HelperJSON.getAmmo(index).penetration;
      if (max < pen) max = pen;
    }
    return max;
  }

  set setAmmo(List<dynamic> list) {
    _ammo.clear();
    _ammo.addAll(list);
    _findMinMax();
  }

  void setName(Locale locale) {
    _name = getName(locale);
  }

  void _findMinMax() {
    int min = 9;
    int max = 1;
    Ammo ammo;
    for (int index in _ammo) {
      ammo = HelperJSON.getAmmo(index);
      if (ammo.min < min) min = ammo.min;
      if (ammo.max > max) max = ammo.max;
    }
    _min = min;
    _max = max;
  }

  String getNameForRecommendedWeaponsList(Locale locale, int? ammoId) =>
      _type == WeaponType.shotgun || _type == WeaponType.bow ? getNameAmmo(locale, ammoId) : getName(locale);

  String getNameAmmo(Locale locale, int? ammoId) => ammoId == null ? "" : HelperJSON.getAmmo(ammoId).getName(locale);

  String getTypeAsString() {
    switch (_type) {
      case (WeaponType.rifle):
        return tr('rifle');
      case (WeaponType.shotgun):
        return tr('shotgun');
      case (WeaponType.handgun):
        return tr('handgun');
      case (WeaponType.bow):
        return tr('bow_crossbow');
      default:
        return "";
    }
  }

  String getName(Locale locale) {
    switch (locale.languageCode.toString()) {
      case "ru":
        return _ru.isEmpty ? _en : _ru;
      case "cs":
        return _cs.isEmpty ? _en : _cs;
      case "pl":
        return _pl.isEmpty ? _en : _pl;
      case "de":
        return _de.isEmpty ? _en : _de;
      case "fr":
        return _fr.isEmpty ? _en : _fr;
      case "es":
        return _es.isEmpty ? _en : _es;
      case "pt":
        return _pt.isEmpty ? _en : _pt;
      case "ja":
        return _ja.isEmpty ? _en : _ja;
      case "sk":
        return _cs.isEmpty ? _en : _cs;
      default:
        return _en;
    }
  }

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      id: json['ID'],
      en: json['EN'],
      ru: json['RU'],
      cs: json['CS'],
      pl: json['PL'],
      de: json['DE'],
      fr: json['FR'],
      es: json['ES'],
      pt: json['PT'],
      ja: json['JA'],
      name: "",
      type: WeaponType.values.elementAt(json['TYPE']),
      mag: json['MAG'],
      min: 0,
      max: 0,
      ammo: [],
      dlc: json['DLC'],
    );
  }

  Map<String, dynamic> _toMap() {
    return {'NAME': _name, 'TYPE': _type.index};
  }

  dynamic get(String propertyName) {
    var mapRep = _toMap();
    if (mapRep.containsKey(propertyName)) {
      return mapRep[propertyName];
    }
    throw ArgumentError('Could not find filter property. Please, go back or restart the application.');
  }
}
