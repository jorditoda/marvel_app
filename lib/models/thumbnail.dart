class Thumbnail {
  String _path;
  String _extension;

  String get path => _path;

  String get extension => _extension;

  Thumbnail({String path, String extension}) {
    _path = path;
    _extension = extension;
  }

  Thumbnail.fromJson(dynamic json) {
    _path = json["path"];
    _extension = json["extension"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["path"] = _path;
    map["extension"] = _extension;
    return map;
  }

  @override
  String toString() {
    return 'Thumbnail{_path: $_path, _extension: $_extension}';
  }
}
