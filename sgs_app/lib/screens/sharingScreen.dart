import 'dart:io';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/url.dart';
import 'package:sgs_app/screens/userScreen.dart';
import 'package:sgs_app/utilities/constants/constants.dart';
import 'package:path/path.dart';
import 'package:sgs_app/widgets/likesWidget.dart';

class SharingScreen extends StatefulWidget {
  final String emailFromLoginScreen;
  SharingScreen({this.emailFromLoginScreen});
  @override
  State<StatefulWidget> createState() => SharingScreenState();

}

class SharingScreenState extends State<SharingScreen> {
  TextEditingController txtMessage = new TextEditingController();
  File _image;
  DbHelper dbHelper;

  Future getImageFromGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      uploadToFirebase(context);
    });

  }

  Future getImageFromCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
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
    await dbHelper.addUrl(Url(url,widget.emailFromLoginScreen,txtMessage.text));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AlertDialog alertDialog = new AlertDialog(
            title: TextField(
              controller: txtMessage,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               IconButton(
                 icon: Icon(Icons.camera_alt),
                 onPressed: (){
                   getImageFromCamera(context);
                   Navigator.of(context).pop();
                 },
               ),
               IconButton(
                 icon: Icon(Icons.camera),
                 onPressed: (){
                   getImageFromGallery(context);
                   Navigator.of(context).pop();
                 },
               ),
              ],
            ),
          );
          showDialog(
              context: context,
              builder: (_)=>alertDialog
          );

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
                        Navigator.of(context).pushReplacementNamed(Constants.ROUTE_LOGIN_SCREEN);

                    }
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Users"),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (BuildContext context) => UserScreen(emailFromLoginScreen: widget.emailFromLoginScreen,)
                      ));
                    },
                  ),
                )
              ];
            },
          )
        ],
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: FirebaseAnimatedList(
                query: dbHelper.getUrl(),
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
                  Url url = Url.fromDataSnapshot(snapshot);
                  return LikesWidget(urlObjectFromSharingScreen: url, emailFromSharingScreen: widget.emailFromLoginScreen, urlFromSharingScreen: url.getUrl,);
                },
              ),
            )
          ],
        ),
      )
    );
  }
 @override
  void setState(fn) {
    super.setState(fn);
    dbHelper = new DbHelper();
    dbHelper.initializeUrlDb();
  }
  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUrlDb();
  }

}