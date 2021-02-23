import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LateralMenuTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function navigate;

  LateralMenuTile({Key key, this.title, this.icon, this.navigate})
      : super(key: key);

  @override
  _LateralMenuTileState createState() =>
      _LateralMenuTileState(title, icon, navigate);
}

class _LateralMenuTileState extends State<LateralMenuTile> {
  String title;
  IconData icon;
  Function navigate;

  _LateralMenuTileState(this.title, this.icon, this.navigate);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context);
        navigate(context);
      },
    );
  }
}
