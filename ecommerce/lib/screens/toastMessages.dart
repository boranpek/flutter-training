import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast Message"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Fluttertoast.showToast(
              msg: "Clicked",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white
            );
          },
          child: Container(
            width: 250.0,
            height: 250.0,
            color: Colors.blue,
            child: Center(
              child: Text("Click Me",
                style: TextStyle(fontSize: 25,color: Colors.red),
            ),
            ),
          ),
        ),
      ),
    );
  }

}