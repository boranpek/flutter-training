import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/friendship.dart';

class FriendshipScreen extends StatefulWidget {
  final String userNameFromAccountScreen;
  final String emailFromUserScreen;
  FriendshipScreen({this.userNameFromAccountScreen,this.emailFromUserScreen});
  @override
  State<StatefulWidget> createState() => FriendshipScreenState();

}

class FriendshipScreenState extends State<FriendshipScreen> {
  DbHelper dbHelper = new DbHelper();
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              query: dbHelper.getFriends().orderByChild('userName').equalTo(widget.emailFromUserScreen),
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
                Friendship friends = Friendship.fromDataSnapshot(snapshot);
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
                                child: Text(friends.getFriendUsername[0].toUpperCase()),
                              ),
                              Text("  " + friends.getFriendUsername, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
                            ],
                          ),

                        ],
                      )
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeFriendshipDb();
  }

}