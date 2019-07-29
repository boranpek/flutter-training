import 'package:firebase_database/firebase_database.dart';

class Url {
  String _id;
  String _url;
  String _userName;
  String _textMessage;

  Url(this._url, this._userName, this._textMessage);

  String get getUrl => _url;
  String get id => _id;
  String get getUserName => _userName;
  String get getTextMessage => _textMessage;

  set userName(String value) {
    _userName = value;
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
    map["userName"] = _userName;
    map["textMessage"] = _textMessage;
    return map;
  }

  Url.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _url = input.value["url"];
    _userName = input.value["userName"];
    _textMessage = input.value["textMessage"];


  }
}

