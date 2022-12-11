// Copyright (c) 2022 Jan Stehno

import 'package:cotwcompanion/helpers/helper_values.dart';
import 'package:cotwcompanion/thehunter/widgets/entries/entry_icon_name.dart';
import 'package:cotwcompanion/thehunter/widgets/misc/custom_appbar.dart';
import 'package:cotwcompanion/thehunter/widgets/misc/custom_rich_text.dart';
import 'package:cotwcompanion/thehunter/widgets/misc/custom_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ActivityLogsInformation extends StatelessWidget {
  const ActivityLogsInformation({Key? key}) : super(key: key);

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
        appBar: WidgetAppBar(
          text: tr('logbook_info'),
          height: 90,
          fontSize: Values.fontSize30,
          fontWeight: FontWeight.w700,
          alignment: Alignment.centerRight,
          function: () {
            Navigator.pop(context);
          },
        ),
        children: [
          Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                EntryIconName(text: tr('logbook_info_1'), icon: "assets/graphics/icons/plus.svg"),
                EntryIconName(text: tr('logbook_info_4'), icon: "assets/graphics/icons/view_semi_compact.svg"),
                EntryIconName(text: tr('date_of_record'), icon: "assets/graphics/icons/sort_date.svg")
              ])),
          Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                EntryIconName(text: tr('logbook_info_6'), icon: "assets/graphics/icons/trophy_lodge.svg"),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: WidgetRichText(text: tr('logbook_info_6_1')))
              ])),
          Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                EntryIconName(text: tr('logbook_info_7'), icon: "assets/graphics/icons/edit.svg"),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: WidgetRichText(text: tr('logbook_info_7_1')))
              ])),
          Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
            EntryIconName(text: tr('logbook_info_5'), icon: "assets/graphics/icons/remove_bin.svg"),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30), child: WidgetRichText(text: tr('logbook_info_5_1'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_5_2')))
          ])),
      Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            EntryIconName(text: tr('logbook_info_2'), icon: "assets/graphics/icons/search.svg"),
            EntryIconName(text: tr('logbook_info_0'), icon: "assets/graphics/icons/separator.svg"),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30), child: WidgetRichText(text: tr('logbook_info_2_1'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_2'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_3'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_4'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_5'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_6'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_2_7')))
          ])),
      Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            EntryIconName(text: tr('logbook_info_3'), icon: "assets/graphics/icons/sort_date.svg"),
            EntryIconName(text: tr('logbook_info_3_1'), icon: "assets/graphics/icons/trophy_gold.svg"),
            EntryIconName(text: tr('logbook_info_3_2'), icon: "assets/graphics/icons/sort_az.svg"),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30), child: WidgetRichText(text: tr('logbook_info_3_3')))
          ])),
      Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            EntryIconName(text: tr('logbook_info_8'), icon: "assets/graphics/icons/export.svg"),
            EntryIconName(text: tr('logbook_info_8_1'), icon: "assets/graphics/icons/import.svg"),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30), child: WidgetRichText(text: tr('logbook_info_8_2'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_8_3'))),
            Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 30, right: 30, top: 10), child: WidgetRichText(text: tr('logbook_info_8_4')))
          ])),
      const SizedBox(height: 30)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidgets(context);
  }
}
