import 'package:flutter/material.dart';
import 'package:marvel_app/pages/serie_details_page.dart';
import 'package:marvel_app/pages/settings_page.dart';
import 'package:marvel_app/pages/support_page.dart';

Future<Object> viewSeriesDetail(BuildContext context, {int serieId}) {
  return _viewPage(context, SeriesDetailsPage(seriesId: serieId));
}

Future<Object> viewSettingsPage(BuildContext context) {
  return _viewPage(context, SettingsPage());
}

Future<Object> viewSupportPage(BuildContext context) {
  return _viewPage(context, SupportPage());
}

Future<Object> _viewPage(BuildContext context, Widget page,
    {String textToShow: "ok"}) async {
  final result = await Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      },
    ),
  );
  print("Resultat al tornar de la pagina:" + result.toString());
  // if (result != null) greenSnackBar(context, textToShow);

  return result;
}
