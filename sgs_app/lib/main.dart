import 'package:flutter/material.dart';
import 'package:sgs_app/screens/loginScreen.dart';
import 'package:sgs_app/screens/userScreen.dart';
import 'package:sgs_app/utilities/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sgs Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
      routes: Routes.routes,
    );
  }
}
