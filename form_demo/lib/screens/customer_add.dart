

import 'package:flutter/material.dart';
import 'package:form_demo/mixins/validation_mixin.dart';
import 'package:form_demo/models/customer.dart';

class CustomerAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CustomerAddState();

}

class CustomerAddState extends State<CustomerAdd> with ValidationMixin { //bu classın içinde ValidationMixin fonksiyonlarını kullanabilmek için with
  final formKey = GlobalKey<FormState>();
  final customer = Customer();
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
      onSaved: (String value){
        customer.firstName = value;
      },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Surname",
          hintText: "Pekel"
      ),
      validator: validateLastName,
      onSaved: (String value){
        customer.lastName = value;
      },
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
      onSaved: (String value){
        customer.email = value;
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
        customer.password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          saveCustomer(customer);
        }
      },
    );
  }

  void saveCustomer(Customer customer) {
    print(customer.firstName);
  }


}