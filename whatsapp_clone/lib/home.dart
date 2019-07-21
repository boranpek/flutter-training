import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/calls_screen.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/screens/status_screen.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "Chat"),
            Tab(text: "Status"),
            Tab(text: "Calls")
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert)

        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("Camera"),
          ChatScreen(),
          StatusScreen(),
          CallsScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: (){
          print("sohbet ekranı");
        },
      ),
    );
  }
}