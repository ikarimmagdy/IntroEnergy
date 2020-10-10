import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';

class IEConsumptionsPage extends StatefulWidget {
  static const String routeName = '/consumptions';

  @override
  State<StatefulWidget> createState() {
   return _IEConsumptionsState();
  }
}

class _IEConsumptionsState extends State<IEConsumptionsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Consumptions"),
        ),
        drawer: IESideMenu(),
        body: Center(child: Text("Events")));
  }
}
