import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/user.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sgs_app/screens/friendshipScreen.dart';
import 'package:sgs_app/screens/userSharingScreen.dart';

class AccountScreen extends StatefulWidget{
  final String userNameFromUserScreen;
  final String emailFromUserScreen;
  AccountScreen({this.userNameFromUserScreen,this.emailFromUserScreen});

  @override
  State<StatefulWidget> createState() => AccountScreenState ();

}

class AccountScreenState extends State<AccountScreen> with TickerProviderStateMixin{
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
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FirebaseAnimatedList(
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
                                        fit: BoxFit.fill
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
            ),

            Flexible(
              child: _buildInfo(),
              flex: 2,
              fit: FlexFit.loose,
            )
          ],
        ),
      )

    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUserDb();
  }

  @override
  void setState(fn) {
    super.setState(fn);
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

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text("Shared", style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text("Friend List", style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
          Container(
            height: 300.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                UserSharingScreen(userNameFromAccountScreen: widget.userNameFromUserScreen,emailFromAccountScreen: widget.emailFromUserScreen,),
                FriendshipScreen(userNameFromAccountScreen: widget.userNameFromUserScreen,emailFromUserScreen: widget.emailFromUserScreen,)
              ],
            ),
          )
        ],
      ),
    );
  }


}