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

  String name = "";
  String lastName = "";
  bool status = false;
  int registerNumber = 0;

  void dispose(){
    nameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void register(String name, String lastName) async {
    final registerTool = await SharedPreferences.getInstance();

    if(generalController.currentState.validate()){
      registerTool.setBool("status", true);
      registerTool.setInt("registerNumber", 1);
      registerTool.setString("name", name);
      registerTool.setString("lastName", lastName);

      Fluttertoast.showToast(
        msg: "Success!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,

      );
    }
  }

  void showRegister() async {
    final registerTool = await SharedPreferences.getInstance();

    bool status = registerTool.getBool("status");
    int registerNumber = registerTool.getInt("registerNumber");
    String name = registerTool.getString("name");
    String lastName= registerTool.getString("lastName");

    setState(() {
      this.name = name;
      this.lastName = lastName;
      this.registerNumber = registerNumber;
      this.status = status;
    });

    Fluttertoast.showToast(
      msg: "Success!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,

    );
  }

  void delete(){

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
                    return "Last name length must be more than 3!";
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
                          register(nameController.text, lastNameController.text);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Registered", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          showRegister();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text("Delete", style: TextStyle(color: Colors.white),),
                        onPressed: (){

                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Name: $name"),
                      Text("Last Name: $lastName"),
                      Text("Status: $status"),
                      Text("Register number: $registerNumber"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}