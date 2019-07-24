import 'package:flutter/material.dart';
import 'package:sgs_app/models/user.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserScreenState();

}

class UserScreenState extends State<UserScreen> {
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
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sgsImg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25.0),
              child: userListItems(),
            )
          ],
        ),
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

  void getData(){
        List<User> usersData = new List<User>();

        setState(() {
          users = usersData;
          count = count;
        });
  }
}