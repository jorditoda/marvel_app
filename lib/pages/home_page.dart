import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marvel_app/api/api_utils.dart';
import 'package:marvel_app/models/series.dart';
import 'package:marvel_app/utils/app_utils.dart';
import 'package:marvel_app/widgets/lateral_menu.dart';
import 'package:marvel_app/widgets/serie_tile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int skip;

  List<Series> seriesList;

  _HomeState();

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  Future<void> refreshData() async {
    skip = 0;
    getSeries().then((value) {
      setState(() {
        seriesList = value;
        _refreshController.refreshCompleted();
      });
    });
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  void onLoading() async {
    skip += 20;
    getSeries(skip: skip).then((value) {
      setState(() {
        seriesList.addAll(value);
        _refreshController.loadComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MarvelSeries"),
      ),
      drawer: LateralMenu(),
      body: seriesList == null
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SmartRefresher(
                physics: BouncingScrollPhysics(),
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropMaterialHeader(
                  color: Colors.indigo,
                ),
                controller: _refreshController,
                onRefresh: refreshData,
                onLoading: onLoading,
                child: _listSeries(),
              ),
            ),
    );
  }

  Widget _listSeries() {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: seriesList.map((Series serie) {
          return InkWell(
            onTap: () {
              viewSeriesDetail(context, serieId: serie.id);
            },
            child: SeriesTile(series: serie),
          );
        }).toList());
  }
}
