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
        child: RaisedButton(
          onPressed: (){
            Fluttertoast.showToast(
              msg: "Clicked button",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white
            );
          },
        ),
      ),
    );
  }

}