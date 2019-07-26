import 'dart:io';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/url.dart';
import 'package:sgs_app/utilities/constants/constants.dart';
import 'package:path/path.dart';

class SharingScreen extends StatefulWidget {
  final String userNameFromLoginScreen;
  SharingScreen({this.userNameFromLoginScreen});
  @override
  State<StatefulWidget> createState() => SharingScreenState();

}

class SharingScreenState extends State<SharingScreen> {
  File _image;
  DbHelper dbHelper;
  Future getImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      uploadToFirebase(context);
    });

  }

  Future uploadToFirebase(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = downUrl;
    await dbHelper.addUrl(Url(url,widget.userNameFromLoginScreen));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage(context);
        },
        tooltip: "Share" ,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Sgs"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context){
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Sign Out"),
                    onTap: (){
                      setState(() {
                        Navigator.of(context).pushReplacementNamed(Constants.ROUTE_LOGIN_SCREEN);
                      });
                    }
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Users"),
                    onTap: (){
                      Navigator.of(context).pushNamed(Constants.ROUTE_USER_SCREEN);
                    },
                  ),
                )
              ];
            },
          )
        ],
      ),
      body:FirebaseAnimatedList(
        query: dbHelper.getUrl(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
          Url url = Url.fromDataSnapshot(snapshot);
          return Card(
            color: Colors.amberAccent,
            elevation: 2,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.account_circle),
                  ),
                  title: Text(url.getUserName),
                  onTap: (){

                  },
                ),
                Image.network(url.getUrl)
              ],
            )
          );
        },
      ),
    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUrlDb();
  }
}