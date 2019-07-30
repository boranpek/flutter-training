import 'package:firebase_database/firebase_database.dart';

class Friendship {
  String _id;
  String _userName;
  String _friendUsername;

  Friendship(this._userName, this._friendUsername);

  String get getId => _id;
  String get getUserName => _userName;
  String get getFriendUsername => _friendUsername;

  set setId(String value) {
    _id = value;
  }

  set setUserName(String value) {
    _userName = value;
  }

  set setFriendUsername(String value) {
    _friendUsername = value;
  }

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["userName"] = _userName;
    map["friendUserName"] = _friendUsername;

    return map;
  }

  Friendship.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _userName = input.value["userName"];
    _friendUsername = input.value["friendUserName"];

  }
}

