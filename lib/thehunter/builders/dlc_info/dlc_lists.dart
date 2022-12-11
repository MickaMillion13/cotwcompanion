// Copyright (c) 2022 Jan Stehno

import 'package:cotwcompanion/helpers/helper_json.dart';
import 'package:cotwcompanion/thehunter/widgets/entries/entry_without_dlc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WidgetDlcLists extends StatefulWidget {
  final List<dynamic> list;
  final List<dynamic> reserves;
  final int type;

  const WidgetDlcLists({Key? key, required this.list, this.reserves = const [], required this.type}) : super(key: key);

  @override
  WidgetDlcListsState createState() => WidgetDlcListsState();
}

class WidgetDlcListsState extends State<WidgetDlcLists> {
  late final List<dynamic> _items = [];

  _getItems() {
    List<dynamic> list = [];
    switch (widget.type) {
      case 1:
        list.addAll(JSONHelper.animals);
        break;
      case 2:
        list.addAll(JSONHelper.weapons);
        break;
      case 3:
        list.addAll(JSONHelper.callers);
        break;
      default:
        list.addAll(JSONHelper.reserves);
        break;
    }
    List<dynamic> result = [];
    for (int d in widget.list) {
      result.add(list[d - 1]);
    }
    _items.addAll(result);
    widget.type == 1 && widget.reserves.isNotEmpty
        ? _items.sort((a, b) => a.getNameBasedOnReserve(context.locale, widget.reserves[0]).compareTo(b.getNameBasedOnReserve(context.locale, widget.reserves[0])))
        : _items.sort((a, b) => a.getName(context.locale).compareTo(b.getName(context.locale)));
  }

  Widget _buildWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return EntryWithoutDlc(
              text: widget.type == 1 && widget.reserves.isNotEmpty
                  ? _items[index].getNameBasedOnReserve(context.locale, widget.reserves[0])
                  : _items[index].getName(context.locale));
        });
  }

  @override
  Widget build(BuildContext context) {
    _getItems();
    return _buildWidgets();
  }
}
