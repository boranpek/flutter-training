import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:work_with_json/apis/api.dart';
import 'package:work_with_json/models/todo.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TodoListAppState();
}

class TodoListAppState extends State<TodoListApp>{
  List<Todo> list = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,position){
          return ListTile(
            title: Text(list[position].title),
          );
        },
      ),
    );
  }

  getTodos(){
    Api.getTodos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list = list.map((todo) => Todo.fromJson(todo)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }
}