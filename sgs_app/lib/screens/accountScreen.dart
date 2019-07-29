import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AccountScreenState ();

}

class AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Sgs"),
      ),
      backgroundColor: Colors.white,
      body: Text(""),
    );
  }
}