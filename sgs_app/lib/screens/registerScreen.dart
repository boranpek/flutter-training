
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/mixins/validation_mixin.dart';
import 'package:sgs_app/models/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();

}

class RegisterScreenState extends State<RegisterScreen> with ValidationMixin{
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtLastName = new TextEditingController();
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtTitle = new TextEditingController();

  DbHelper dbHelper = new DbHelper();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Sgs"),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sgsImg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            Container(
              margin: EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    firstNameField(),
                    lastNameField(),
                    userNameField(),
                    passwordField(),
                    titleField(),
                    submitButton()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeDb();
  }


  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "name"
      ),
      validator: validateFirstName,
      controller: txtName,
    );
  }

  Widget userNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "User Name",
          hintText: "username"
      ),
      validator: validateUserName,
      controller: txtUserName,
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Surname",
        hintText: "surname",
      ),
      validator: validateLastName,
      controller: txtLastName,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "password"
      ),
      obscureText: true,
      controller: txtPassword,
    );
  }

  Widget titleField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Title",
          hintText: "title"
      ),
      controller: txtTitle,

    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Submit", style: TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent),),
      color: Colors.black45,
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          addToDatabase();
        }
      },
    );
  }

  void addToDatabase() async {
    int result = await dbHelper.insert(User(txtName.text,txtLastName.text,txtUserName.text,txtPassword.text,txtTitle.text));
    if(result != 0)
      Navigator.pop(context,true);
  }


}