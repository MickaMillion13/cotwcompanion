// Copyright (c) 2022 Jan Stehno

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cotwcompanion/miscellaneous/helpers/loadout.dart';
import 'package:cotwcompanion/miscellaneous/interface/interface.dart';
import 'package:cotwcompanion/activities/logs_add_edit.dart';
import 'package:cotwcompanion/activities/info_animal.dart';
import 'package:cotwcompanion/model/animal.dart';
import 'package:cotwcompanion/model/zone.dart';
import 'package:cotwcompanion/widgets/icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EntryNeedZone extends StatefulWidget {
  final Animal animal;
  final int reserveId, index, count, hour;
  final List<Zone> zones;
  final bool compact, classSlider;

  const EntryNeedZone({
    Key? key,
    required this.animal,
    required this.reserveId,
    required this.zones,
    required this.hour,
    required this.index,
    required this.count,
    required this.compact,
    required this.classSlider,
  }) : super(key: key);

  @override
  EntryNeedZoneState createState() => EntryNeedZoneState();
}

class EntryNeedZoneState extends State<EntryNeedZone> {
  final List<int> _finalZones = [4, 4, 4];

  double _getSize() {
    double top = widget.compact
        ? widget.classSlider
            ? 150
            : 75
        : 0;
    double height = (MediaQuery.of(context).size.height - top) / (widget.count <= 10 ? widget.count : 10);
    return widget.compact
        ? height < 75
            ? height
            : 75
        : 75;
  }

  void _getData() {
    if (widget.zones.length != 1) {
      _finalZones.clear();
      for (Zone zone in widget.zones) {
        int hourNow = widget.hour;
        int hourAfter = hourNow + 1 == 24 ? 0 : hourNow + 1;
        int hourAfterAfter = hourAfter + 1 == 24 ? 0 : hourAfter + 1;
        if ((hourNow >= zone.from && hourNow <= zone.to) ||
            (hourAfter >= zone.from && hourAfter <= zone.to) ||
            (hourAfterAfter >= zone.from && hourAfterAfter <= zone.to)) {
          for (int hour = zone.from; hour < zone.to; hour++) {
            if (hour == hourNow || hour == hourAfter || hour == hourAfterAfter) {
              _finalZones.add(zone.zone);
            }
          }
        }
      }
    }
  }

  Widget _getZones() {
    int zoneNow = _finalZones[0];
    int zoneAfter = _finalZones[1];
    int zoneAfterAfter = _finalZones[2];
    return Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      WidgetIcon(
        size: 35,
        icon: Zone.iconForZone(zoneNow),
        color: zoneNow == 4
            ? Interface.dark
            : zoneNow == 3
                ? Interface.light
                : Interface.alwaysDark,
        background: Zone.colorForZone(zoneNow),
      ),
      WidgetIcon(
        size: 30,
        iconSize: 12,
        icon: Zone.iconForZone(zoneAfter),
        color: zoneAfter == 4
            ? Interface.dark.withOpacity(0.75)
            : zoneAfter == 3
                ? Interface.light.withOpacity(0.75)
                : Interface.alwaysDark.withOpacity(0.75),
        background: Zone.colorForZone(zoneAfter).withOpacity(0.5),
      ),
      WidgetIcon(
        size: 25,
        iconSize: 10,
        icon: Zone.iconForZone(zoneAfterAfter),
        color: zoneAfter == 4
            ? Interface.dark.withOpacity(0.5)
            : zoneAfter == 3
                ? Interface.light.withOpacity(0.5)
                : Interface.alwaysDark.withOpacity(0.5),
        background: Zone.colorForZone(zoneAfterAfter).withOpacity(0.25),
      ),
    ]);
  }

  Widget _buildWidgets() {
    _getData();
    return Dismissible(
        key: Key(widget.index.toString()),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (direction) async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ActivityLogsAddEdit(
                        animalId: widget.animal.id,
                        reserveId: widget.reserveId,
                        callback: () {},
                        fromTrophyLodge: false,
                      )));
          return false;
        },
        background: Container(
            alignment: Alignment.centerLeft,
            color: Interface.dark,
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SvgPicture.asset(
                  "assets/graphics/icons/edit.svg",
                  height: 20,
                  width: 20,
                  color: Interface.light,
                  alignment: Alignment.centerLeft,
                ))),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityAnimalInfo(animalId: widget.animal.id)));
            },
            child: Container(
                height: _getSize(),
                padding: const EdgeInsets.only(left: 30, right: 30),
                color: widget.index % 2 == 0 ? Interface.even : Interface.odd,
                child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 15),
                          child: Row(children: [
                            AutoSizeText(widget.animal.level.toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  color: Interface.dark,
                                  fontSize: Interface.s24,
                                  fontWeight: FontWeight.w600,
                                )),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 30),
                                    child: AutoSizeText(
                                      widget.animal.getNameBasedOnReserve(context.locale, widget.reserveId),
                                      textAlign: TextAlign.start,
                                      maxLines: widget.animal.getNameBasedOnReserve(context.locale, widget.reserveId).split(" ").length == 1 ? 1 : 2,
                                      style: TextStyle(
                                        color: Interface.dark,
                                        fontSize: Interface.s20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )))
                          ]))),
                  HelperLoadout.isLoadoutActivated
                      ? Container(
                          width: 10,
                          padding: const EdgeInsets.all(0),
                          child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
                            (HelperLoadout.loadoutMin <= widget.animal.level && widget.animal.level <= HelperLoadout.loadoutMax)
                                ? Container(
                                    padding: EdgeInsets.only(bottom: (HelperLoadout.containsCallerForAnimal(widget.animal.id)) ? 3 : 0),
                                    child: SvgPicture.asset(
                                      "assets/graphics/icons/loadout.svg",
                                      width: 10,
                                      color: Interface.dark,
                                    ))
                                : Container(),
                            HelperLoadout.containsCallerForAnimal(widget.animal.id)
                                ? Container(
                                    padding: EdgeInsets.only(
                                        top: (HelperLoadout.loadoutMin <= widget.animal.level && widget.animal.level <= HelperLoadout.loadoutMax) ? 3 : 0),
                                    child: SvgPicture.asset(
                                      "assets/graphics/icons/sense_hearing.svg",
                                      width: 10,
                                      color: Interface.dark,
                                    ))
                                : Container()
                          ]))
                      : Container(),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 125,
                    padding: const EdgeInsets.only(left: 15),
                    child: _getZones(),
                  )
                ]))));
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
