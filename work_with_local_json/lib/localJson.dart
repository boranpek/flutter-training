import 'dart:convert';

import 'package:flutter/material.dart';


class LocalJson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocalJsonState();
}

class LocalJsonState  extends State<LocalJson>{
  List student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/datas/class.json"),
            builder: (context, answer) {
              student = jsonDecode(answer.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Student Name:" + student[index]['name'])
                      ],
                    ),
                  );
                },
                itemCount: student == null ? 0 : student.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
