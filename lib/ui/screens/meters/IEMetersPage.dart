import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';
import 'package:intro_energy/ui/screens/history/IEHistoryPage.dart';

class IEMetersPage extends StatefulWidget {
  static const String routeName = '/meters';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _IEMetersPageState();
  }
}

class _IEMetersPageState extends State<IEMetersPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Meters"),
        ),
        drawer: IESideMenu(),
        body: Center(child: Text("Events")));
  }
}
