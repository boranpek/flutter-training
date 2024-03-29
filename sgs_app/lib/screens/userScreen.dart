import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/friendship.dart';
import 'package:sgs_app/models/user.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:sgs_app/screens/accountScreen.dart';

class UserScreen extends StatefulWidget {
  final String emailFromLoginScreen;
  UserScreen({this.emailFromLoginScreen});
  @override
  State<StatefulWidget> createState() => UserScreenState();

}

class UserScreenState extends State<UserScreen> {
  DbHelper dbHelper = new DbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Users"),
      ),
      backgroundColor: Colors.white,
      body:FirebaseAnimatedList(
        query: dbHelper.getUsers(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
          User user = User.fromDataSnapshot(snapshot);
          return Card(
            color: Colors.amberAccent,
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Text(user.getName[0].toUpperCase() + user.getLastName[0].toUpperCase()),
                    ),
                    Text("  " + user.getUserName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
                    Text(" (" + user.getTitle + ")", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w100),)
                  ],
                )
               ,
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context){
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                            leading: Icon(Icons.forward),
                            title: Text("Go to profile"),
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) => AccountScreen(userNameFromUserScreen: user.getUserName, emailFromUserScreen: user.getEmail,)
                              ));
                            }
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.person_add),
                          title: Text("Add to friend list"),
                          onTap: (){
                            if(widget.emailFromLoginScreen != user.getEmail){
                              setState(() {
                                dbHelper.initializeFriendshipDb();
                                addFriend(user.getUserName);
                                Fluttertoast.showToast(
                                    msg: user.getUserName + " Added to your friendlist",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white
                                );
                              });
                            }
                            else {
                              AlertDialog alertDialog = new AlertDialog(
                                title: Text("Oops..."),
                                content: Text("You can't add yourself to your friendlist :)"),
                              );
                              showDialog(
                                  context: context,
                                  builder: (_)=>alertDialog
                              );

                            }
                          },
                        ),
                      )
                    ];
                  },
                )
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
    dbHelper.initializeUserDb();
  }

  void addFriend (String friendUserName) async {
    await dbHelper.addFriend(Friendship(widget.emailFromLoginScreen,friendUserName));
  }



}