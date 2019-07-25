import 'package:flutter/material.dart';
import 'package:sgs_app/utilities/constants/constants.dart';

class SharingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharingScreenState();

}

class SharingScreenState extends State<SharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

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
                      Navigator.of(context).pushNamed(Constants.ROUTE_LOGIN_SCREEN);
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
      body:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25.0),
            )
          ],
        ),
    );
  }
}