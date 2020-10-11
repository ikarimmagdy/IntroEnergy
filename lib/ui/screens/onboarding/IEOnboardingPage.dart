import 'package:flutter/material.dart';
import 'package:intro_energy/routes/routes.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class IEOnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IEOnboardingPageState();
  }
}

class _IEOnboardingPageState extends State<IEOnboardingPage> {
  final pages = [
    SkOnboardingModel(
        title: 'Check Consumtion',
        description:
        'Easily Track your consumptions',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding1.png'),
    SkOnboardingModel(
        title: 'Track History',
        description:
        'Track all previous payments and consumptions history',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding2.png'),
    SkOnboardingModel(
        title: 'Pay quick and easy',
        description: 'Pay for order using credit or debit card',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding3.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("History",style: TextStyle(color: Colors.white)),
        ),
        drawer: IESideMenu(),
        body: SKOnboardingScreen(
          bgColor: Colors.white,
          themeColor:  Colors.green,
          pages: pages,
          skipClicked: (value) {
            Navigator.of(context).pushReplacementNamed(Routes.login);
          },
          getStartedClicked: (value) {
            Navigator.of(context).pushReplacementNamed(Routes.login);
          },
        ),
    );
  }
}
