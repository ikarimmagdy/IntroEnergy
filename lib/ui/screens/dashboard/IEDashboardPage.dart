import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'IESideMenu.dart';

class IEDashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<IEDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: IESideMenu(),
        body: Center(child: Text("Dashboard")));
  }
}


