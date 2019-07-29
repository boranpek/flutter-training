import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/mixins/validation_mixin.dart';
import 'package:sgs_app/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sgs_app/screens/sharingScreen.dart';

import 'package:sgs_app/utilities/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  TextEditingController txtUserName = new TextEditingController();
  DbHelper dbHelper = new DbHelper();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Sgs"),
      ),
      backgroundColor: Colors.white,
      body:ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sgsImg.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      userNameField(),
                      passwordField(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          loginButton(),
                          registerButton()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUserDb();
  }


  Widget userNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "UserName",
          hintText: "username"
      ),
      validator: validateFirstName,
      controller: txtUserName,
      onSaved: (String value){

      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "password"
      ),
      obscureText: true,
      onSaved: (String value){

      },
    );
  }

  Widget loginButton() {
    return RaisedButton(
      child: Text("Sign in", style: TextStyle(fontSize: 15.0, color: Colors.white),),
      color: Colors.black45,
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          Fluttertoast.showToast(
              msg: "Success!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white
          );
          sleep(const Duration(seconds:2));
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => SharingScreen(userNameFromLoginScreen: txtUserName.text,)
          ));
        }
      },
    );
  }

  Widget registerButton() {
    return RaisedButton(
      child: Text("Register", style: TextStyle(fontSize: 15.0, color: Colors.white),),
      color: Colors.black45,
      onPressed: (){
        Navigator.of(context).pushNamed(Constants.ROUTE_REGISTER_SCREEN);
      },
    );
  }

  void saveUser(User user) {
    print(user.getName);
  }


}