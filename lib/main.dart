import 'package:flutter/material.dart';
import 'package:intro_energy/routes/routes.dart';
import 'package:intro_energy/ui/screens/consumtions/IEConsumptionsPage.dart';
import 'package:intro_energy/ui/screens/dashboard/IEDashboardPage.dart';
import 'package:intro_energy/ui/screens/history/IEHistoryPage.dart';
import 'package:intro_energy/ui/screens/history/IEMainHistory.dart';
import 'package:intro_energy/ui/screens/login/IELoginPage.dart';
import 'package:intro_energy/ui/screens/meters/IEMetersPage.dart';
import 'package:intro_energy/ui/screens/onboarding/IEOnboardingPage.dart';
import 'package:intro_energy/ui/screens/payment/IEPaymentsPage.dart';
import 'package:intro_energy/ui/screens/splash/IESplashPage.dart';
import 'package:intro_energy/ui/screens/support/IESupportPage.dart';

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
      home: IESplashPage(),
      routes:  {
        Routes.dashboard: (context) => IEDashboardPage(),
        Routes.meters: (context) => IEMetersPage.withSampleData(),
        Routes.payments: (context) => IEPaymentsPage(),
        Routes.consumptions: (context) => IEConsumptionPage(),
        Routes.history: (context) => IEHistoryPage(),
        Routes.splash: (context) => IESplashPage(),
        Routes.login: (context) => IELoginPage(),
        Routes.support: (context) => IESupportPage(),
        Routes.onboarding: (context) => IEOnboardingPage(),
      },
    );
  }
}
