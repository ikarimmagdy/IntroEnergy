import 'package:flutter/material.dart';
import 'package:intro_energy/routes/routes.dart';
import 'package:intro_energy/ui/screens/consumtions/IEConsumptionsPage.dart';
import 'package:intro_energy/ui/screens/dashboard/IEDashboardPage.dart';
import 'package:intro_energy/ui/screens/history/IEHistoryPage.dart';
import 'package:intro_energy/ui/screens/meters/IEMetersPage.dart';
import 'package:intro_energy/ui/screens/payment/IEPaymentsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Energy',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IEDashboardPage(),
      routes:  {
        Routes.dashboard: (context) => IEDashboardPage(),
        Routes.meters: (context) => IEMetersPage(),
        Routes.payments: (context) => IEPaymentsPage(),
        Routes.consumptions: (context) => IEConsumptionsPage(),
        Routes.history: (context) => IEHistoryPage(),
      },
    );
  }
}
