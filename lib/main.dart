import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

const Map<int, Color> color = {
  50: Color.fromRGBO(237, 29, 36, .1),
  100: Color.fromRGBO(237, 29, 36, .2),
  200: Color.fromRGBO(237, 29, 36, .3),
  300: Color.fromRGBO(237, 29, 36, .4),
  400: Color.fromRGBO(237, 29, 36, .5),
  500: Color.fromRGBO(237, 29, 36, .6),
  600: Color.fromRGBO(237, 29, 36, .7),
  700: Color.fromRGBO(237, 29, 36, .8),
  800: Color.fromRGBO(237, 29, 36, .9),
  900: Color.fromRGBO(237, 29, 36, 1),
};

const MaterialColor colorCustom = MaterialColor(0xFFED1D24, color);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Home(),
    );
  }
}
