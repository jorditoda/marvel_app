import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marvel_app/api/api_utils.dart';
import 'package:marvel_app/models/creator.dart';
import 'package:marvel_app/widgets/creator_tile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeriesDetailsPage extends StatefulWidget {
  final int seriesId;

  const SeriesDetailsPage({Key key, this.seriesId}) : super(key: key);

  @override
  _SeriesDetailsPageState createState() => _SeriesDetailsPageState(seriesId);
}

class _SeriesDetailsPageState extends State<SeriesDetailsPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int skip = 0;
  List<Creator> creators;
  int seriesId;

  _SeriesDetailsPageState(this.seriesId);

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  Future<void> refreshData() async {
    skip = 0;
    getCreatorsBySeriesId(seriesId.toString()).then((value) {
      setState(() {
        creators = value;
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
    skip = 20 + skip;
    getCreatorsBySeriesId(seriesId.toString(), skip: skip).then((value) {
      setState(() {
        creators.addAll(value);
        _refreshController.loadComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return creators == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).creators),
            ),
            body: SafeArea(
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
                child: _listCreators(),
              ),
            ),
          );
  }

  Widget _listCreators() {
    return creators.isEmpty
        ? Center(child: Text(AppLocalizations.of(context).creators_not_found))
        : ListView.builder(
            itemCount: creators.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final creator = creators[index];
              return CreatorTile(creator: creator);
            },
            // ),
          );
  }
}
