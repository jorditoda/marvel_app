import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/models/creator.dart';

class CreatorTile extends StatefulWidget {
  final Creator creator;

  const CreatorTile({Key key, this.creator}) : super(key: key);

  @override
  _CreatorTileState createState() => _CreatorTileState(creator);
}

class _CreatorTileState extends State<CreatorTile> {
  Creator creator;

  _CreatorTileState(this.creator);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return creator == null
        ? Center(child: CircularProgressIndicator())
        : Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Container(
          height: 140,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: NetworkImage(
                // ignore: null_aware_before_operator
                creator.thumbnail.path +
                    '/standard_amazing.' +
                    creator.thumbnail.extension,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(creator.fullName),
      ),
    );


  }
}
