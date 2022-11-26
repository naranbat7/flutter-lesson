import 'package:facebook/screens/home/index.dart';
import 'package:facebook/screens/home/notification.dart';
import 'package:facebook/screens/login.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static final String login = "login";
  static final String home = "home";
  static final String notification = "notification";
}

var routes = <String, WidgetBuilder>{
  RouteNames.login: (_) => LoginPage(),
  RouteNames.home: (_) => HomePage(),
  RouteNames.notification: (_) => NofiticationPage(),
};
