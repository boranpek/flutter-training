import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sgs_app/screens/sharingScreen.dart';
import 'package:sgs_app/utilities/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  TextEditingController txtEmail = new TextEditingController();
  DbHelper dbHelper = new DbHelper();
  String _email;
  String _password;
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
                      emailField(),
                      passwordField(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          loginButton(),
                          registerButton(),
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


  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "email@sgs.com"
      ),
      validator: validateEmail,
      controller: txtEmail,
      onSaved: (String value){
        _email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "password"
      ),
      validator: validatePassword,
      obscureText: true,
      onSaved: (String value){
        _password = value;
      },
    );
  }

  Widget loginButton() {
    return RaisedButton(
      child: Text("Sign in", style: TextStyle(fontSize: 15.0, color: Colors.white),),
      color: Colors.black45,
      onPressed: (){
        loginUser();
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


  void loginUser() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Fluttertoast.showToast(
            msg: "Success!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white
        );
        sleep(const Duration(seconds:1));
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => SharingScreen(emailFromLoginScreen: txtEmail.text,)
        ));
      }
      catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: "Wrong Email or Password!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
      }

    }

  }


}