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
  double xPosition = 0.0;
  double yPosition = 0.0;
  double boxSize = 150.0;

  @override
  Widget build(BuildContext context) {
    if (xPosition == 0.0)
      centerBox(context);
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
                width: boxSize,
                height: boxSize,
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

  void centerBox(BuildContext context){
    xPosition = MediaQuery.of(context).size.width / 2.0 - boxSize / 2.0;
    yPosition = MediaQuery.of(context).size.height / 2.0 - boxSize / 2.0 - 30.0;

    setState(() {
      this.xPosition = xPosition;
      this.yPosition = yPosition;
    });
  }

}