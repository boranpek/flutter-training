

import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CustomerAddState();

}

class CustomerAddState extends State<CustomerAdd>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameField(),
            lastNameField(),
            emailField(),
            passwordField(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Boran"
      ),
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Surname",
          hintText: "Pekel"
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "...@mail.com"
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "password"
      ),
      obscureText: true
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: (){

      },
    );
  }


}