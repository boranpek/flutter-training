import 'package:firebase_database/firebase_database.dart';

class Likes {
  String _id;
  String _url;
  String _email;

  Likes(this._url, this._email);

  String get getId => _id;
  String get getUrl => _url;
  String get getEmail => _email;

  set setId(String value) {
    _id = value;
  }

  set setEmail(String value) {
    _email = value;
  }

  set setUrl(String value) {
    _url = value;
  }

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["url"] = _url;
    map["email"] = _email;
    return map;
  }

  Likes.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _url = input.value["url"];
    _email = input.value["email"];
  }


}