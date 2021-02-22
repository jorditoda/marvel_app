class Items {
  String _resourceURI;
  String _name;
  String _type;

  String get resourceURI => _resourceURI;
  String get name => _name;
  String get type => _type;

  Items({
    String resourceURI,
    String name,
    String type}){
    _resourceURI = resourceURI;
    _name = name;
    _type = type;
  }

  Items.fromJson(dynamic json) {
    _resourceURI = json["resourceURI"];
    _name = json["name"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["resourceURI"] = _resourceURI;
    map["name"] = _name;
    map["type"] = _type;
    return map;
  }

}
