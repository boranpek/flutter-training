

import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CustomerAddState();

}

class CustomerAddState extends State<CustomerAdd>{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
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
      validator: (String value){
        if(value.length < 2)
          return "Name length should be more than 2";
        return null;
      },
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
        formKey.currentState.validate();
      },
    );
  }


}