class User {
  int _id;
  String _firstName;
  String _lastName;
  String _password;
  String _userName;
  String _title;


  User(this._firstName, this._lastName,this._userName, this._password,this._title);
  User.withId(this._id,this._firstName,this._lastName,this._userName, this._password);

  int get id => _id;
  String get getName => _firstName;
  String get getLastName => _lastName;
  String get getUserName => _userName;
  String get getTitle => _title;


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

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["name"] = _firstName;
    map["lastName"] = _lastName;
    map["userName"] = _userName;
    map["password"] = _password;
    map["title"] = _title;
    if(id != null)
      map["id"] = id;
    return map;
  }

}