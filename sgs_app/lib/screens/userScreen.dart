import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sgs_app/db/dbHelper.dart';
import 'package:sgs_app/models/user.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserScreenState();

}

class UserScreenState extends State<UserScreen> {
  DbHelper dbHelper = new DbHelper();
  List<User> users;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Sgs"),
      ),
      backgroundColor: Colors.orangeAccent,
      body:FirebaseAnimatedList(
        query: dbHelper.getUsers(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
          User user = User.fromDataSnapshot(snapshot);
          return Card(
            color: Colors.amberAccent,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black54,
                child: Text(user.getName[0] + user.getLastName[0]),
              ),
              title: Text(user.getUserName),
              subtitle: Text(user.getTitle),
              onTap: (){

              },
            ),
          );
        },
      ),
    );
  }
  userListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.amberAccent,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(users[position].getName[0] + users[position].getLastName[0]),
              ),
              title: Text(this.users[position].getUserName),
              subtitle: Text(this.users[position].getTitle),
              onTap: (){

              },
            ),
          );
        }
    );
  }

  void initState() {
    super.initState();
    dbHelper = new DbHelper();
    dbHelper.initializeDb();
  }

  void getData(){
        List<User> usersData = new List<User>();

        setState(() {
          users = usersData;
          count = count;
        });
  }
}