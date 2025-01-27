// Copyright (c) 2022 Jan Stehno

import 'package:cotwcompanion/miscellaneous/helpers/filter.dart';
import 'package:cotwcompanion/miscellaneous/helpers/json.dart';
import 'package:cotwcompanion/miscellaneous/types.dart';
import 'package:cotwcompanion/miscellaneous/interface/interface.dart';
import 'package:cotwcompanion/widgets/title_functional.dart';
import 'package:cotwcompanion/widgets/appbar.dart';
import 'package:cotwcompanion/widgets/scaffold.dart';
import 'package:cotwcompanion/widgets/scrollbar.dart';
import 'package:cotwcompanion/widgets/searchbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuilderAddLoadoutItems extends StatefulWidget {
  final List<int> selected;
  final Function set;
  final ObjectType type;

  const BuilderAddLoadoutItems({
    Key? key,
    required this.selected,
    required this.set,
    required this.type,
  }) : super(key: key);

  @override
  BuilderAddLoadoutItemsState createState() => BuilderAddLoadoutItemsState();
}

class BuilderAddLoadoutItemsState extends State<BuilderAddLoadoutItems> {
  final _controller = TextEditingController();
  final List<int> _selectedList = [];
  final List<int> _filtered = [];

  @override
  void initState() {
    _controller.addListener(() => _reload());
    _selectedList.addAll(widget.selected);
    super.initState();
  }

  void _reload() {
    _filtered.clear();
    setState(() {
      if (widget.type == ObjectType.ammo) {
        _filtered.addAll(HelperFilter.filterLoadoutItemsByName(ObjectType.ammo, _controller.text, context));
      } else {
        _filtered.addAll(HelperFilter.filterLoadoutItemsByName(ObjectType.caller, _controller.text, context));
      }
    });
  }

  bool _contains(int itemId) {
    for (int index = 0; index < _selectedList.length; index++) {
      if (_selectedList[index] == itemId) {
        return true;
      }
    }
    return false;
  }

  void _addOrRemove(int itemId) {
    bool add = true;
    for (int index = 0; index < _selectedList.length; index++) {
      if (_selectedList[index] == itemId) {
        _selectedList.removeAt(index);
        add = false;
        continue;
      }
    }
    if (add) _selectedList.add(itemId);
  }

  Widget _buildItems() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _filtered.length,
        itemBuilder: (context, index) {
          int itemId = _filtered[index];
          String text = widget.type == ObjectType.ammo
              ? HelperJSON.getAmmo(HelperJSON.getWeaponsAmmo(itemId).secondId).getName(context.locale)
              : HelperJSON.getCaller(itemId).getName(context.locale);
          String subText = widget.type == ObjectType.ammo ? HelperJSON.getWeapon(HelperJSON.getWeaponsAmmo(itemId).firstId).getName(context.locale) : "";
          return WidgetTitleFunctional.withSwitch(
              text: text,
              subText: subText,
              icon: "assets/graphics/icons/minus.svg",
              inactiveIcon: "assets/graphics/icons/plus.svg",
              textColor: Interface.dark,
              subTextColor: Interface.disabled,
              background: index % 2 == 0 ? Interface.even : Interface.odd,
              iconColor: Interface.alwaysDark,
              iconInactiveColor: Interface.alwaysDark,
              buttonBackground: Interface.selected,
              buttonInactiveBackground: Interface.unselected,
              oneLine: true,
              isActive: widget.type == ObjectType.ammo ? _contains(HelperJSON.getWeaponsAmmo(itemId).secondId) : _contains(itemId),
              onTap: () {
                setState(() {
                  _addOrRemove(widget.type == ObjectType.ammo ? HelperJSON.getWeaponsAmmo(itemId).secondId : itemId);
                  widget.set(widget.type, _selectedList);
                });
              });
        });
  }

  Widget _buildWidgets() {
    return WidgetScaffold.withCustomBody(
        body: Column(children: [
      Column(children: [
        WidgetAppBar(
            text: widget.type == ObjectType.weapon ? tr('weapon_ammo') : tr('callers'),
            color: Interface.accent,
            background: Interface.primary,
            fontSize: Interface.s30,
            context: context),
        WidgetSearchBar(
          background: Interface.searchBackground,
          color: Interface.search,
          controller: _controller,
        )
      ]),
      Expanded(
          child: WidgetScrollbar(
              child: SingleChildScrollView(
                  child: Column(children: [
        _buildItems(),
      ]))))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    _reload();
    return _buildWidgets();
  }
}
