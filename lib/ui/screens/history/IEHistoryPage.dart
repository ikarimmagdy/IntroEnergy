import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';

class IEHistoryPage extends StatefulWidget {
  static const String routeName = '/history';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IEHistoryPageState();
  }
}

class _IEHistoryPageState extends State<IEHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        drawer: IESideMenu(),
        body: Center(child: Text("Events")));
  }
}
