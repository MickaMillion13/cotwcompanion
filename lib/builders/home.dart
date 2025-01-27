// Copyright (c) 2022 Jan Stehno

import 'dart:async';
import 'package:cotwcompanion/miscellaneous/helpers/json.dart';
import 'package:cotwcompanion/miscellaneous/helpers/log.dart';
import 'package:cotwcompanion/miscellaneous/interface/interface.dart';
import 'package:cotwcompanion/activities/home.dart';
import 'package:cotwcompanion/model/ammo.dart';
import 'package:cotwcompanion/model/animal.dart';
import 'package:cotwcompanion/model/animal_fur.dart';
import 'package:cotwcompanion/model/caller.dart';
import 'package:cotwcompanion/model/dlc.dart';
import 'package:cotwcompanion/model/fur.dart';
import 'package:cotwcompanion/model/idtoid.dart';
import 'package:cotwcompanion/model/log.dart';
import 'package:cotwcompanion/model/reserve.dart';
import 'package:cotwcompanion/model/weapon.dart';
import 'package:cotwcompanion/model/zone.dart';
import 'package:cotwcompanion/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuilderHome extends StatelessWidget {
  const BuilderHome({
    Key? key,
  }) : super(key: key);

  Future<Widget> _forcedDelay() async {
    return await Future.delayed(const Duration(seconds: 2), () => const ActivityHome());
  }

  Widget _buildWidgets() {
    return FutureBuilder(
        future: Future.wait([
          HelperJSON.readAmmo(),
          HelperJSON.readAnimals(),
          HelperJSON.readAnimalsCallers(),
          HelperJSON.readAnimalsFurs(),
          HelperJSON.readAnimalsReserves(),
          HelperJSON.readAnimalsZones(),
          HelperJSON.readCallers(),
          HelperJSON.readDlcs(),
          HelperJSON.readFurs(),
          HelperJSON.readReserves(),
          HelperJSON.readWeapons(),
          HelperJSON.readWeaponsAmmo(),
          HelperJSON.readMapObjects(),
          HelperLog.readLogs(),
          _forcedDelay()
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return WidgetError(text: snapshot.error.toString());
          } else if (snapshot.hasData) {
            var ammo = snapshot.data![0] as List<Ammo>;
            var animals = snapshot.data![1] as List<Animal>;
            var animalsCallers = snapshot.data![2] as List<IdtoId>;
            var animalsFurs = snapshot.data![3] as List<AnimalFur>;
            var animalsReserves = snapshot.data![4] as List<IdtoId>;
            var animalsZones = snapshot.data![5] as List<Zone>;
            var callers = snapshot.data![6] as List<Caller>;
            var dlcs = snapshot.data![7] as List<Dlc>;
            var furs = snapshot.data![8] as List<Fur>;
            var reserves = snapshot.data![9] as List<Reserve>;
            var weapons = snapshot.data![10] as List<Weapon>;
            var weaponsAmmo = snapshot.data![11] as List<IdtoId>;
            var mapObjects = snapshot.data![12] as Map<String, dynamic>;
            var logs = snapshot.data![13] as List<Log>;
            var widget = snapshot.data![14] as Widget;
            HelperJSON.setLists(
                ammo, animals, animalsCallers, animalsFurs, animalsReserves, animalsZones, callers, dlcs, furs, reserves, weapons, weaponsAmmo, mapObjects);
            HelperJSON.setWeaponAmmo();
            HelperLog.setLogs(logs, context);
            return widget;
          } else {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: SpinKitThreeBounce(size: 30, color: Interface.accent),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
