import 'package:firebase_database/firebase_database.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/user.dart';

class ValidationMixin{
  DbHelper dbHelper;
  List<User> users = new List();
  String validateFirstName(String value){
    if(value.length < 2)
      return "Name length must be more than 2 character";
    return null;
  }
  String validateLastName(String value){
    if(value.length < 2)
      return "Surname length must be more than 2 character";
    return null;
  }
  String validateEmail(String value){
    if(!value.contains("@sgs.com"))
      return "Mail must include '@sgs.com'!";
    return null;
  }

  String validateUserName(String value){
    if(value.length < 2)
      return "Wrong Username!";
    return null;
  }

  String validatePassword(String value){
    if(value.length < 6)
      return "Password should be more than 6 character!";
    return null;
  }
  void initState() {
    dbHelper = new DbHelper();
    dbHelper.initializeUserDb();
  }
}
