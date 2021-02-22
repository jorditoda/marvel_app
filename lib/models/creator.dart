import 'package:marvel_app/models/events.dart';
import 'package:marvel_app/models/series.dart';
import 'package:marvel_app/models/stories.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:marvel_app/models/urls.dart';

import 'comics.dart';

class Creator {
  int _id;
  String _firstName;
  String _middleName;
  String _lastName;
  String _suffix;
  String _fullName;
  String _modified;
  Thumbnail _thumbnail;
  String _resourceURI;
  Comics _comics;
  Series _series;
  Stories _stories;
  Events _events;
  List<Urls> _urls;

  int get id => _id;

  String get firstName => _firstName;

  String get middleName => _middleName;

  String get lastName => _lastName;

  String get suffix => _suffix;

  String get fullName => _fullName;

  String get modified => _modified;

  Thumbnail get thumbnail => _thumbnail;

  String get resourceURI => _resourceURI;

  Comics get comics => _comics;

  Series get series => _series;

  Stories get stories => _stories;

  Events get events => _events;

  List<Urls> get urls => _urls;


  Creator(
      {int id,
      String firstName,
      String middleName,
      String lastName,
      String suffix,
      String fullName,
      String modified,
      Thumbnail thumbnail,
      String resourceURI,
      Comics comics,
      Series series,
      Stories stories,
      Events events,
      List<Urls> urls}) {
    _id = id;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _suffix = suffix;
    _fullName = fullName;
    _modified = modified;
    _thumbnail = thumbnail;
    _resourceURI = resourceURI;
    _comics = comics;
    _series = series;
    _stories = stories;
    _events = events;
    _urls = urls;
  }

  Creator.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["firstName"];
    _middleName = json["middleName"];
    _lastName = json["lastName"];
    _suffix = json["suffix"];
    _fullName = json["fullName"];
    _modified = json["modified"];
    _thumbnail = json["thumbnail"] != null
        ? Thumbnail.fromJson(json["thumbnail"])
        : null;
    _resourceURI = json["resourceURI"];
    _comics = json["comics"] != null ? Comics.fromJson(json["comics"]) : null;
    _series = json["series"] != null ? Series.fromJson(json["series"]) : null;
    _stories =
        json["stories"] != null ? Stories.fromJson(json["stories"]) : null;
    _events = json["events"] != null ? Events.fromJson(json["events"]) : null;
    if (json["urls"] != null) {
      _urls = [];
      json["urls"].forEach((v) {
        _urls.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["middleName"] = _middleName;
    map["lastName"] = _lastName;
    map["suffix"] = _suffix;
    map["fullName"] = _fullName;
    map["modified"] = _modified;
    if (_thumbnail != null) {
      map["thumbnail"] = _thumbnail.toJson();
    }
    map["resourceURI"] = _resourceURI;
    if (_comics != null) {
      map["comics"] = _comics.toJson();
    }
    if (_series != null) {
      map["series"] = _series.toJson();
    }
    if (_stories != null) {
      map["stories"] = _stories.toJson();
    }
    if (_events != null) {
      map["events"] = _events.toJson();
    }
    if (_urls != null) {
      map["urls"] = _urls.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'Creator{_id: $_id, _firstName: $_firstName, _middleName: $_middleName, _lastName: $_lastName, _suffix: $_suffix, _fullName: $_fullName, _modified: $_modified, _thumbnail: $_thumbnail, _resourceURI: $_resourceURI, _comics: $_comics, _series: $_series, _stories: $_stories, _events: $_events, _urls: $_urls}';
  }
}
