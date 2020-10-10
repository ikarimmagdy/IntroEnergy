import 'package:intro_energy/ui/screens/consumtions/IEConsumptionsPage.dart';
import 'package:intro_energy/ui/screens/dashboard/IEDashboardPage.dart';
import 'package:intro_energy/ui/screens/history/IEHistoryPage.dart';
import 'package:intro_energy/ui/screens/login/IELoginPage.dart';
import 'package:intro_energy/ui/screens/meters/IEMetersPage.dart';
import 'package:intro_energy/ui/screens/payment/IEPaymentsPage.dart';
import 'package:intro_energy/ui/screens/splash/IESplashPage.dart';

class Routes {
  static const String dashboard = IEDashboardPage.routeName;
  static const String meters = IEMetersPage.routeName;
  static const String consumptions = IEConsumptionsPage.routeName;
  static const String payments = IEPaymentsPage.routeName;
  static const String history = IEHistoryPage.routeName;
  static const String splash = IESplashPage.routeName;
  static const String login = IELoginPage.routeName;
}