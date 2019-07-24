import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
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
      _db = await initializeDb();
    }
    return _db;
  }

  initializeDb() async {
    _dbReference = _db.reference().child("Users");
    return _dbReference;
  }


  insert(User user) async {
    var result = await _dbReference.push().set(user.toMap());
    return result;
  }

  getProducts(){

  }
}