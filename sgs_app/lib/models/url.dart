import 'package:firebase_database/firebase_database.dart';

class Url {
  String _id;
  String _url;

  String get getUrl => _url;
  String get id => _id;

  set setUrl(String value) {
    _url = value;
  }

  Url(this._url);

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["url"] = _url;

    return map;
  }

  Url.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _url = input.value["url"];

  }
}

