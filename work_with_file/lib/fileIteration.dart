import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RegisterIteration {
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


