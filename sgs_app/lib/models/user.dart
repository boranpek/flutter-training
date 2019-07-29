import 'package:firebase_database/firebase_database.dart';

class User {
  String _id;
  String _firstName;
  String _lastName;
  String _password;
  String _userName;
  String _title;
  String _email;
  List<User> _friendList;




  User(String firstName, String lastName, String userName, String password, String title, String email){
    _firstName = firstName;
    _lastName = lastName;
    _userName = userName;
    _password = password;
    _title = title;
    _email = email;
    _friendList = new List<User>();
  }

  User.withId(String id, String firstName, String lastName, String userName, String password, String title, String email){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _userName = userName;
    _password = password;
    _title = title;
    _email = email;
    _friendList = new List<User>();
  }

  String get id => _id;
  String get getName => _firstName;
  String get getLastName => _lastName;
  String get getUserName => _userName;
  String get getTitle => _title;
  List<User> get getFriendList => _friendList;

  set setFriendList(List<User> value) {
    _friendList = value;
  }

  set setLastName(String value) {
    if(value.length > 2)
      _lastName = value;
  }
  set setUserName(String value) {
    if(value.length > 2)
      _lastName = value;
  }

  set setFirstName(String value) {
    if(value.length > 2)
      _firstName = value;
  }

  set setPassword(String value) {
    if(value.length > 2)
      _password = value;
  }

  set setTitle(String value) {
    if(value.length > 2)
      _title = value;
  }


  void addToList(User user){
    _friendList.add(user);
  }

  void deleteFromList(User user) {
    _friendList.remove(user);
  }

  Map<String,dynamic> toMap() {

    var map = Map<String,dynamic>();

    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["userName"] = _userName;
    map["password"] = _password;
    map["title"] = _title;
    map["email"] = _email;

    if(id != null)
      map["id"] = id;

    return map;
  }

  User.fromDataSnapshot(DataSnapshot input) {
    _id = input.key;
    _firstName = input.value["firstName"];
    _lastName = input.value["lastName"];
    _userName = input.value["userName"];
    _password = input.value["password"];
    _title = input.value["title"];
    _email = input.value["email"];
  }

}