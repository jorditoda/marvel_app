import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/utils/app_utils.dart';

class LateralMenuTile extends StatefulWidget {
  final String title;
  final IconData icon;

  LateralMenuTile({Key key, this.title, this.icon}) : super(key: key);

  @override
  _LateralMenuTileState createState() => _LateralMenuTileState(title, icon);
}

class _LateralMenuTileState extends State<LateralMenuTile> {
  String title;
  IconData icon;

  _LateralMenuTileState(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context);
        viewSettingsPage(context);
      },
    );
  }
}
