import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lateral_menu_tile.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          LateralMenuTile(title: 'Settings', icon: Icons.settings),
          LateralMenuTile(title: 'Support', icon: Icons.support)
        ],
      ),
    );
  }
}
