import 'package:flutter/material.dart';
import 'package:sgs_app/screens/loginScreen.dart';
import 'package:sgs_app/screens/registerScreen.dart';
import 'package:sgs_app/screens/sharingScreen.dart';
import 'package:sgs_app/screens/userScreen.dart';
import 'package:sgs_app/utilities/constants/constants.dart';

class Routes {
  static final routes = <String,WidgetBuilder> {
    Constants.ROUTE_REGISTER_SCREEN: (BuildContext context) => RegisterScreen(),
    Constants.ROUTE_LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
    Constants.ROUTE_USER_SCREEN: (BuildContext context) => UserScreen(),
    Constants.ROUTE_SHARING_SCREEN: (BuildContext context) => SharingScreen()
  };
}