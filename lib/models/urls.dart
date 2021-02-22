class Urls {
  String _type;
  String _url;

  String get type => _type;
  String get url => _url;

  Urls({
    String type,
    String url}){
    _type = type;
    _url = url;
  }

  Urls.fromJson(dynamic json) {
    _type = json["type"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["url"] = _url;
    return map;
  }

}
