import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_app/constants/app_constants.dart';
import 'package:marvel_app/models/creator.dart';
import 'package:marvel_app/models/series.dart';

Future<List<Series>> getSeries({skip: 0, take: 20}) async {
  String url = baseUrl +
      series_path +
      _getAuth() +
      offset +
      skip.toString() +
      limit +
      take.toString();
  print("url to getSeries " + url);
  final response = await http.get(url);
  print(response.statusCode);
  // print(response.body);
  if (response.statusCode == 200) {
    print("tot Ok");
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return responseBody['data']['results'].map<Series>((json) => Series.fromJson(json)).toList();
  }
  // errorSnackBar(context, text: response.body);

  return null;
}

Future<List<Creator>> getCreatorsBySeriesId(String seriesId,
    {skip: 0, take: 20}) async {
  String url = baseUrl +
      series_path +
      '/' +
      seriesId +
      '/' +
      creators_path +
      _getAuth() +
      offset +
      skip.toString() +
      limit +
      take.toString();
  print("url to getCreatorsBySeriesId " + url);
  final response = await http.get(url);
  print(response.statusCode);
  // print(response.body);
  if (response.statusCode == 200) {
    print("tot Ok");
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return responseBody['data']['results'].map<Creator>((json) => Creator.fromJson(json)).toList();
  }
  // errorSnackBar(context, text: response.body);

  return null;
}


String _getAuth() {
  String ts = DateTime.now().millisecondsSinceEpoch.toString();
  String auth = ts + private_key + public_key;
  return api_key +
      public_key +
      ts_query +
      ts +
      hash +
      md5.convert(utf8.encode(auth)).toString();
}
