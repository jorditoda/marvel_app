import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marvel_app/utils/app_utils.dart';

import 'lateral_menu_tile.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          LateralMenuTile(
            title: AppLocalizations.of(context).settings,
            icon: Icons.settings,
            navigate: viewSettingsPage,
          ),
          LateralMenuTile(
            title: AppLocalizations.of(context).support,
            icon: Icons.support,
            navigate: viewSupportPage,
          )
        ],
      ),
    );
  }
}
