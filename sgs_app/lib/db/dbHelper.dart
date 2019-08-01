import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:sgs_app/models/friendship.dart';
import 'package:sgs_app/models/url.dart';
import 'package:sgs_app/models/user.dart';

class DbHelper {
  DatabaseReference _dbReference;
  StreamSubscription<Event> _dbFlow;
  FirebaseDatabase _db = FirebaseDatabase();
  DatabaseError error;

  StreamSubscription<Event> get getDbFlow => _dbFlow;

  set setDbFlow(StreamSubscription<Event> dbFlow) {
    _dbFlow = dbFlow;
  }

  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  Future<FirebaseDatabase> get db async {
    if(_db == null){
      _db = await initializeUserDb();
    }
    return _db;
  }

  initializeUserDb() async {
    _dbReference = _db.reference().child("Users");
    return _dbReference;
  }


  insert(User user) async {
    var result = await _dbReference.push().set(user.toMap());
    return result;
  }

  getUsers(){
    return _dbReference;
  }

  updateUser(User user) {
    _dbReference.child(user.id).update(user.toMap());
  }

  initializeUrlDb() async {
    _dbReference = _db.reference().child("Url");
    return _dbReference;
  }

  addUrl(Url url) async {
    var result = await _dbReference.push().set(url.toMap());
    return result;
  }

  getUrl(){
    return _dbReference;
  }

  initializeFriendshipDb() async {
    _dbReference = _db.reference().child("Friendship");
    return _dbReference;
  }

  addFriend(Friendship friend) async {
    var result = await _dbReference.push().set(friend.toMap());
    return result;
  }

  getFriends(){
    return _dbReference;
}

}