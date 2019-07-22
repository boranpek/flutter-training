import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharedScreenState();

}

class SharedScreenState extends State<SharedScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final generalController = GlobalKey<FormState>();

  void dispose(){
    nameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Form(
        key: generalController,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value){
                  if(value.length < 3)
                    return "Name length must be more than 3!";
                  return null;
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Please enter your name"
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value.length < 3)
                    return "Last n ame length must be more than 3!";
                  return null;
                },
                controller: lastNameController,
                decoration: InputDecoration(
                    hintText: "Please enter your last name"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text("Register", style: TextStyle(color: Colors.white),),
                        onPressed: (){

                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Register", style: TextStyle(color: Colors.white),),
                        onPressed: (){

                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text("Registered", style: TextStyle(color: Colors.white),),
                        onPressed: (){

                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}