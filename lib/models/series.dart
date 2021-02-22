import 'package:marvel_app/models/stories.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:marvel_app/models/urls.dart';

import 'characters.dart';
import 'comics.dart';
import 'creator.dart';
import 'events.dart';

class Series {
  int _id;
  String _title;
  dynamic _description;
  String _resourceURI;
  List<Urls> _urls;
  int _startYear;
  int _endYear;
  String _rating;
  String _type;
  String _modified;
  Thumbnail _thumbnail;
  Creator _creators;
  Characters _characters;
  Stories _stories;
  Comics _comics;
  Events _events;
  dynamic _next;
  dynamic _previous;

  int get id => _id;
  String get title => _title;
  dynamic get description => _description;
  String get resourceURI => _resourceURI;
  List<Urls> get urls => _urls;
  int get startYear => _startYear;
  int get endYear => _endYear;
  String get rating => _rating;
  String get type => _type;
  String get modified => _modified;
  Thumbnail get thumbnail => _thumbnail;
  Creator get creators => _creators;
  Characters get characters => _characters;
  Stories get stories => _stories;
  Comics get comics => _comics;
  Events get events => _events;
  dynamic get next => _next;
  dynamic get previous => _previous;

  Series({
      int id,
      String title,
      dynamic description,
      String resourceURI,
      List<Urls> urls,
      int startYear,
      int endYear,
      String rating,
      String type,
      String modified,
      Thumbnail thumbnail,
      Creator creators,
      Characters characters,
      Stories stories,
      Comics comics,
      Events events,
      dynamic next,
      dynamic previous}){
    _id = id;
    _title = title;
    _description = description;
    _resourceURI = resourceURI;
    _urls = urls;
    _startYear = startYear;
    _endYear = endYear;
    _rating = rating;
    _type = type;
    _modified = modified;
    _thumbnail = thumbnail;
    _creators = creators;
    _characters = characters;
    _stories = stories;
    _comics = comics;
    _events = events;
    _next = next;
    _previous = previous;
}

  Series.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _description = json["description"];
    _resourceURI = json["resourceURI"];
    if (json["urls"] != null) {
      _urls = [];
      json["urls"].forEach((v) {
        _urls.add(Urls.fromJson(v));
      });
    }
    _startYear = json["startYear"];
    _endYear = json["endYear"];
    _rating = json["rating"];
    _type = json["type"];
    _modified = json["modified"];
    _thumbnail = json["thumbnail"] != null ? Thumbnail.fromJson(json["thumbnail"]) : null;
    _creators = json["creators"] != null ? Creator.fromJson(json["creators"]) : null;
    _characters = json["characters"] != null ? Characters.fromJson(json["characters"]) : null;
    _stories = json["stories"] != null ? Stories.fromJson(json["stories"]) : null;
    _comics = json["comics"] != null ? Comics.fromJson(json["comics"]) : null;
    _events = json["events"] != null ? Events.fromJson(json["events"]) : null;
    _next = json["next"];
    _previous = json["previous"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["description"] = _description;
    map["resourceURI"] = _resourceURI;
    if (_urls != null) {
      map["urls"] = _urls.map((v) => v.toJson()).toList();
    }
    map["startYear"] = _startYear;
    map["endYear"] = _endYear;
    map["rating"] = _rating;
    map["type"] = _type;
    map["modified"] = _modified;
    if (_thumbnail != null) {
      map["thumbnail"] = _thumbnail.toJson();
    }
    if (_creators != null) {
      map["creators"] = _creators.toJson();
    }
    if (_characters != null) {
      map["characters"] = _characters.toJson();
    }
    if (_stories != null) {
      map["stories"] = _stories.toJson();
    }
    if (_comics != null) {
      map["comics"] = _comics.toJson();
    }
    if (_events != null) {
      map["events"] = _events.toJson();
    }
    map["next"] = _next;
    map["previous"] = _previous;
    return map;
  }

}
