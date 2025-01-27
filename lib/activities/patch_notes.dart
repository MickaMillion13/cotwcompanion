// Copyright (c) 2022 Jan Stehno

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cotwcompanion/miscellaneous/interface/interface.dart';
import 'package:cotwcompanion/widgets/patch_note.dart';
import 'package:cotwcompanion/widgets/appbar.dart';
import 'package:cotwcompanion/widgets/scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityPatchNotes extends StatelessWidget {
  const ActivityPatchNotes({
    Key? key,
  }) : super(key: key);

  void _redirectToGitHub() async {
    if (!await launchUrl(Uri(scheme: "https", host: "github.com", path: "/janstehno/cotwcompanion/issues"))) {
      throw 'Unfortunately the link could not be launched. Please, go back or restart the application.';
    }
  }

  Widget _buildLink() {
    return GestureDetector(
        onTap: () {
          _redirectToGitHub();
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            color: Interface.searchBackground,
            alignment: Alignment.centerRight,
            child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: AutoSizeText(tr('issues_and_plans'),
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Interface.search,
                            fontSize: Interface.s20,
                            fontWeight: FontWeight.w800,
                          )))),
              SvgPicture.asset(
                "assets/graphics/icons/external_link.svg",
                width: 15,
                height: 15,
                color: Interface.search,
              )
            ])));
  }

  Widget _buildList() {
    return Column(children: [
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.6.5",
        changes: const [
          "- Improvement of the UI. Need zones feature now shows what zone animal has at, and will have after the current and next hour. There is now also a slider to filter animals based on their class.",
          "- Added filter for the Weapons. You can now filter weapons by their type. E.g. If you type 'shotgun' in the search box, there will be only shotguns in the list."
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.6.2 - 1.6.4",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.6.1",
        changes: const [
          "- Improvement of the UI. Added scrollbars.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.6.0",
        changes: const [
          "- Improvement of the UI. Maps were reworked due to performance issues. There are now 3 zoom levels. First one shows the most general positions for animals, as well as outposts and lookouts. Second one shows more accurate positions for animals, as well as outposts, lookouts, and hides. Third level shows positions of need zones for animals, as well as everything before. Keep in mind that there could still appear some performance issues.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.5.9",
        changes: const [
          "- Hunter Power Pack update.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.5.8",
        changes: const [
          "- Improvement of the UI. Added zoom feature for maps. As well as new background. There could appear some performance issues.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.5.7",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.5.6",
        changes: const [
          "- Hungarian language.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.5.5",
        changes: const [
          "- Improvement of the UI. Loadouts can be edited now.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.5.2 - 1.5.4",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.5.1",
        changes: const [
          "- New England Mountains update.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.5.0",
        changes: const [
          "- Improvement of the UI. Fixed few problems when creating a record in Catch book and Trophy lodge.",
          "- Changed word values (mostly from rare to uncommon) of furs for almost every animal. Per cent values remained the same.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.4.9",
        changes: const [
          "- Turkish language.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.4.8",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.4.7",
        changes: const [
          "- Improvement of the UI. Added back button for each page.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.primary,
        version: "1.4.6",
        changes: const [
          "- App released for iOS, available in the App Store.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.4.5",
        changes: const [
          "- Assorted Sidearms Pack update.",
          "- Improvement of the UI. You can now switch between dots and circles in the maps.",
          "- Catch book and Trophy lodge now shows corrupted logs. Corrupted log is a log that has incorrect value/s. For now they will be invisible but saved. I am working on a feature which will help you fix them and therefore show them in the list.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.4.4",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.4.3",
        changes: const [
          "- Improvement of the UI. You can now show the details of the loadout by single tapping it. Select loadout by tapping the button beside its name.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.4.2",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.4.1",
        changes: const [
          "- Loadouts feature. Uneditable for now, you will have to create a new loadout. You will have to select a loadout every time you start up the application. Use double tap for the deletion.",
          "- Improvement of the UI. Compact view for Need zones feature. Maximum items per screen is 10, works only in portrait mode.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.4.0",
        changes: const [
          "- Revontuli Coast update.",
          "- Improvement of the UI. As there is very low variety in ammo for shotguns, bows, and crossbows, animal's recommended weapons of these types now show as an ammo instead of a weapon.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.3.9",
        changes: const [
          "- Improvement of the UI. Catch book and Trophy lodge features are loaded separately now.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.3.8",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.3.7",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.3.6",
        changes: const [
          "- Improvement of the UI. Added Export / Import feature for Catch book and Trophy lodge feature.",
          "- Catch book record can now be created from Need Zones feature and Reserve's animal list. You can create it by swiping the list item to the right.",
          "- Patch Notes feature. Only in English for now. Link on GitHub website with future plans and issues of the newest version of the app.",
          "- Improvement of the UI. Overhauled have been map zones (some zones can overlap) and various icons. Animal's images have been added including their anatomy.",
          "- Filter for animal's recommended weapons in the settings. It chooses the weapons based on the highest minimum class and the greatest penetration. If possible at least one weapon is chosen from the base game and at least one is chosen from DLC.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.3.5",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.3.4",
        changes: const [
          "- Improvement of the UI. Especially of the Catch book and Trophy lodge feature.",
          "- Great Ones added.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.3.3",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.3.2",
        changes: const [
          "- Trophy lodge feature.",
          "- Japanese language.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.3.1",
        changes: const [
          "- Modern Rifle Pack update.",
          "- Catch book feature.",
          "- Improvement of the UI. Percentage chance for fur types.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.primary,
        version: "1.3.0",
        changes: const [
          "- Migration of the whole app to the new programming environment.",
          "- App re-released for Android. App should be also releasable for iOS.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.2.9",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.2.8",
        changes: const [
          "- Improvement of the UI. Mostly of landscape view.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.2.7",
        changes: const [
          "- Improvement of the UI. Need zones are changing over time. Improvement for colorblind users.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.2.6",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.2.5",
        changes: const [
          "- Mississippi Acres Preserve update.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.2.4",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.2.3",
        changes: const [
          "- Improvement of the UI. Dark mode now persists.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.2.2",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.2.1",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.2.0",
        changes: const [
          "- Rancho Del Arroyo update.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.1.4 - 1.1.9",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.1.3",
        changes: const [
          "- Improvement of the UI. Need zones will change when hour is set. Temporary dark mode.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.1.2",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.1.1",
        changes: const [
          "- Improvement of the UI. Language option in the settings.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.1.0",
        changes: const [
          "- Fur rarity for each animal.",
          "- Information about ammunition.",
          "- Portuguese language.",
          "- Improvement of the UI. Need zones for animals are now separate for each reserve.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.0.9",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.0.8",
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.0.7",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.0.6",
        changes: const [
          "- Improvement of the UI. Added class of the animals and recommended callers for each reserve. Useful when you are preparing for the hunt.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.0.5",
        changes: const [
          "- Te Awaroa National Park update.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.0.4",
        changes: const [
          "- Information about callers.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.0.3",
      ),
      WidgetPatchNote(
        color: Interface.odd,
        version: "1.0.2",
        changes: const [
          "- Information about weapons.",
        ],
      ),
      WidgetPatchNote(
        color: Interface.even,
        version: "1.0.1",
      ),
      WidgetPatchNote(
        color: Interface.primary,
        version: "1.0.0",
        changes: const [
          "- 27. 11. 2020",
          "- Information about animals.",
          "- Semi-working maps.",
          "- English, Czech, Russian, Polish, German, France, and Spanish language.",
        ],
      )
    ]);
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
        appBar: WidgetAppBar(text: tr('patch_notes'), color: Interface.accent, background: Interface.primary, fontSize: Interface.s30, context: context),
        children: [_buildLink(), _buildList()]);
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
