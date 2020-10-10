import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';

class IEPaymentsPage extends StatefulWidget {
  static const String routeName = '/payments';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IEPaymentPageState();
  }
}

class _IEPaymentPageState extends State<IEPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Payments"),
        ),
        drawer: IESideMenu(),
        body: Center(child: Text("Events")));
  }
}
