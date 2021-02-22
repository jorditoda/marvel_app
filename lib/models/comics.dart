import 'items.dart';

class Comics {
  int _available;
  String _collectionURI;
  List<Items> _items;
  int _returned;

  int get available => _available;
  String get collectionURI => _collectionURI;
  List<Items> get items => _items;
  int get returned => _returned;

  Comics({
    int available,
    String collectionURI,
    List<Items> items,
    int returned}){
    _available = available;
    _collectionURI = collectionURI;
    _items = items;
    _returned = returned;
  }

  Comics.fromJson(dynamic json) {
    _available = json["available"];
    _collectionURI = json["collectionURI"];
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(Items.fromJson(v));
      });
    }
    _returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["available"] = _available;
    map["collectionURI"] = _collectionURI;
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    map["returned"] = _returned;
    return map;
  }

}
