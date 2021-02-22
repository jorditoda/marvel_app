
class Events {
  int _available;
  String _collectionURI;
  int _returned;

  int get available => _available;
  String get collectionURI => _collectionURI;
  int get returned => _returned;

  Events({
    int available,
    String collectionURI,
    List<dynamic> items,
    int returned}){
    _available = available;
    _collectionURI = collectionURI;
    _returned = returned;
  }

  Events.fromJson(dynamic json) {
    _available = json["available"];
    _collectionURI = json["collectionURI"];

    _returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["available"] = _available;
    map["collectionURI"] = _collectionURI;
    map["returned"] = _returned;
    return map;
  }

}
