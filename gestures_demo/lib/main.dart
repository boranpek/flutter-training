import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabsCount = 0;
  int doubleTabsCount = 0;
  int longPressedCount = 0;
  double xPosition = 40.0;
  double yPosition = 60.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures Demo"),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            tabsCount++;
          });
        },
        onDoubleTap: (){
          setState(() {
            doubleTabsCount++;
          });
        },
        onLongPress: (){
          setState(() {
            longPressedCount++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value){
          setState(() {
            yPosition += value.delta.dy;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value){
          setState(() {
            xPosition += value.delta.dx;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child:
        Padding(
          child: Text("Tab : $tabsCount, Double Tab: $doubleTabsCount, Long Press: $longPressedCount"),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }

}