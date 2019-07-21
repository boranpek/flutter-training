import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}