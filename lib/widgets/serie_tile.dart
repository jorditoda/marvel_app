import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/models/series.dart';

class SeriesTile extends StatefulWidget {
  final Series series;

  const SeriesTile({Key key, this.series}) : super(key: key);

  @override
  _SeriesTileState createState() => _SeriesTileState(series);
}

class _SeriesTileState extends State<SeriesTile> {
  Series series;

  _SeriesTileState(this.series);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(
                  series.thumbnail.path +
                      '/standard_amazing.' +
                      series.thumbnail.extension,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            series.title,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
