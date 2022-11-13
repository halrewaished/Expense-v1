import 'package:flutter/material.dart';
// import 'package:onboarding_screen_example/main.dart';
// import 'package:onboarding_screen_example/page/onboarding_page.dart';
// import 'package:onboarding_screen_example/widget/button_widget.dart';
import 'package:expense_project/main.dart';
import 'package:expense_project/page1/onboarding_page.dart';
import 'package:expense_project/widget1/button_widget.dart';
import 'package:expense_project/main.dart';
import '../main.dart';
import 'onboarding_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            // title: Text(MyApp.),
            ),
        body: Center(child: Text('wlecome')),
      );

  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );
}
