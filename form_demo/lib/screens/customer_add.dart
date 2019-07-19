

import 'package:flutter/material.dart';
import 'package:form_demo/mixins/validation_mixin.dart';

class CustomerAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CustomerAddState();

}

class CustomerAddState extends State<CustomerAdd> with ValidationMixin { //bu classın içinde ValidationMixin fonksiyonlarını kullanabilmek için with
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
      validator: validateFirstName,
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Surname",
          hintText: "Pekel"
      ),
      validator: validateLastName,
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "...@mail.com"
      ),
      validator: validateEmail,
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