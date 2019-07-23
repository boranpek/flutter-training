import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RecordIteration {
  Future<String> get filePath async {
    final location = await getApplicationDocumentsDirectory();
    return location.path;
  }

  Future<File> get createFile async {
    final path = await filePath;
    return File("$path/newfile.txt");
  }

  Future<String> readFile() async {
    try{
      final file = await createFile;
      String content = await file.readAsString();
      return content;
    }
    catch(e){
      return "Error: $e";
    }
  }

  Future<File> writeFile(String content) async {
    final file = await createFile;
    return file.writeAsString(content);
  }
}

class FileIteration extends StatefulWidget {
  final RecordIteration recordIteration;
  const FileIteration({Key key, this.recordIteration}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FileIterationState();

}

class FileIterationState extends State<FileIteration> {
  final textController = TextEditingController();
  String data = "";

  Future<File> recordData() async {
    setState(() {
      data = textController.text;
    });
    return widget.recordIteration.writeFile(data);
  }

  @override
  void initState() {
    super.initState();
  }

  void readData() {
    widget.recordIteration.readFile().then((value){
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Iteration"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter data",
            ),
            controller: textController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: recordData,
                    child: Text("Record Data",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: readData,
                    child: Text("Read Data",style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(data),
            ),
          )
        ],
      ),
    );
  }
}

