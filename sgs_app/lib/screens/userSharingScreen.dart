import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/url.dart';


class UserSharingScreen extends StatefulWidget {
  final String userNameFromAccountScreen;
  final String emailFromAccountScreen;
  UserSharingScreen({this.userNameFromAccountScreen,this.emailFromAccountScreen});
  @override
  State<StatefulWidget> createState() => UserSharingScreenState();

}

class UserSharingScreenState extends State<UserSharingScreen> {
  TextEditingController txtMessage = new TextEditingController();
  DbHelper dbHelper = new DbHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              query: dbHelper.getUrl().orderByChild('email').equalTo(widget.emailFromAccountScreen),
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
                        Image.network(url.getUrl),
                        Text(url.getTextMessage, style: TextStyle(fontSize: 15.0),),
                        Row(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment(0, 0),
                              children: <Widget>[
                                Icon(Icons.favorite, color: Colors.black, size: 30.0,),
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.white,),
                                )
                              ],
                            ),
                          ],
                        )

                      ],
                    )
                );
              },
            ),
          ),
        ],
      )
    );
  }
  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeUrlDb();
  }

}