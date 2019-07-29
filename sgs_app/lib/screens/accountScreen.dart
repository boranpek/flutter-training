import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/url.dart';
import 'package:sgs_app/models/user.dart';
import 'dart:async';
import 'package:path/path.dart';

class AccountScreen extends StatefulWidget{
  final String userNameFromUserScreen;
  AccountScreen({this.userNameFromUserScreen});
  @override
  State<StatefulWidget> createState() => AccountScreenState ();

}

class AccountScreenState extends State<AccountScreen> {
  bool urlStatus = false;
  DbHelper dbHelper = new DbHelper();
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,

        title: Text(widget.userNameFromUserScreen + " Profile"),
      ),
      backgroundColor: Colors.white,
      body: FirebaseAnimatedList(
        query: dbHelper.getUsers(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
          User user = User.fromDataSnapshot(snapshot);
          if(user.getUserName == widget.userNameFromUserScreen){
            return Card(
                color: Colors.white,
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(user.getProfilePicture),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: (){
                              getImageFromGallery(context,user);
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                )
            );
          }
          else
            return Text("");

        },
      ),

    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUserDb();
  }

  Future getImageFromGallery(BuildContext context,User user) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      uploadToFirebase(context,user);
    });

  }
  Future uploadToFirebase(BuildContext context,User user) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    var picUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    await dbHelper.updateUser(User.withId(user.id,user.getName, user.getLastName, user.getUserName, user.getPassword, user.getTitle, user.getEmail, picUrl));
  }


}