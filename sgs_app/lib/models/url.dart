import 'package:firebase_database/firebase_database.dart';

class Url {
  String _id;
  String _url;
  String _email;
  String _textMessage;

  Url(this._url, this._email, this._textMessage);

  String get getUrl => _url;
  String get id => _id;
  String get getUserName => _email;
  String get getTextMessage => _textMessage;

  set setEmail(String value) {
    _email = value;
  }

  set setUrl(String value) {
    _url = value;
  }

  set setTextMessage(String value) {
    _textMessage = value;
  }

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["url"] = _url;
    map["email"] = _email;
    map["textMessage"] = _textMessage;
    return map;
  }

  Url.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _url = input.value["url"];
    _email = input.value["email"];
    _textMessage = input.value["textMessage"];
  }
}

