import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/likes.dart';
import 'package:sgs_app/models/url.dart';

class LikesWidget extends StatefulWidget {
  final String emailFromSharingScreen;
  final Url urlObjectFromSharingScreen;
  final String urlFromSharingScreen;
  LikesWidget({this.emailFromSharingScreen,this.urlFromSharingScreen,this.urlObjectFromSharingScreen});
  @override
  State<StatefulWidget> createState() => LikesWidgetState();

}

class LikesWidgetState extends State<LikesWidget> {
  DbHelper dbHelper = new DbHelper();
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: dbHelper.getLikes().orderByChild('email').equalTo(widget.emailFromSharingScreen),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
        Likes likes = Likes.fromDataSnapshot(snapshot);
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
                  title: Text(widget.urlObjectFromSharingScreen.getUserName),
                  onTap: (){

                  },
                ),
                Image.network(widget.urlObjectFromSharingScreen.getUrl),
                Text(widget.urlObjectFromSharingScreen.getTextMessage, style: TextStyle(fontSize: 15.0),),
                Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment(0, 0),
                      children: <Widget>[
                        Icon(Icons.favorite, color: Colors.black, size: 30.0,),
                        IconButton(
                          icon: Icon(Icons.favorite, color: Colors.white,),
                          onPressed: (){
                            setState(() {

                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[

                  ],
                )

              ],
            )
        );
      },
    );
  }

  void addToDatabase() async {
    await dbHelper.addLikes(Likes(widget.urlFromSharingScreen,widget.emailFromSharingScreen));
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeLikesDb();
    addToDatabase();
  }
}