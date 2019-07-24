import 'package:flutter/material.dart';

class SharingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharingScreenState();

}

class SharingScreenState extends State<SharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Sgs"),
      ),
      backgroundColor: Colors.orangeAccent,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sgsImg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25.0),
            )
          ],
        ),
      ),
    );
  }
}