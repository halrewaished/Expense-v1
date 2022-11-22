import 'package:expense_project/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

// import 'package:onboarding_screen_example/page/home_page.dart';
// import 'package:onboarding_screen_example/widget/button_widget.dart';
import 'package:expense_project/widget1/button_widget1.dart';
import 'package:expense_project/page/home_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_page.dart';

class OnBoardingPage extends StatelessWidget {
  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomePage()),
      );

  @override
  Widget build(BuildContext context) {
    //********* PAGE 1
    var body1 = Container(
      child: Column(children: [
        // Image.assets("assets/saving.jpg"),
        Image.asset(
          'assets/images/welcome.png',
        ),
        Text(
          'مرحبا',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Container(
            width: 260,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'التطبيق الذي سوف يساعدك على ادارة شؤونك المالية',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )
      ]),
      // width: 620,
      // height: 50,
    );

    var title1 = Padding(
      padding: const EdgeInsets.all(58.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 66),
          child: Text(
            'RISEUP',
            style: TextStyle(
                height: 0.2,
                fontSize: 40,
                color: Color(0xff4C7360),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    //********* PAGE 2
    var body2 = Container(
      child: Column(children: [
        // Image.assets("assets/saving.jpg"),
        Image.asset(
          'assets/images/saving.jpg',
        ),
        Text(
          'ادخر',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 66),
          child: Container(
            // width: 48,
            child: Text(
              'وفر اموالك بشكل فعال دون قلق',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ]),
      // width: 620,
      // height: 50,
    );

    var title2 = Padding(
      padding: const EdgeInsets.all(58.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 66),
          child: Text(
            'RISEUP',
            style: TextStyle(
                height: 0.2,
                fontSize: 40,
                color: Color(0xff4C7360),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    //********* PAGE 2
    var body3 = Container(
      child: Column(children: [
        Image.asset(
          'assets/images/findOut.png',
        ),
        Text(
          'اكتشف',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Container(
            // width: 48,
            child: Text(
              'آكتشف الفئات الاكثر انفاقا',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ]),
      // width: 620,
      // height: 50,
    );

    var title3 = Padding(
      padding: const EdgeInsets.all(58.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 66),
          child: Text(
            'RISEUP',
            style: TextStyle(
                height: 0.2,
                fontSize: 40,
                color: Color(0xff4C7360),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: title1,
              bodyWidget: body1,
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: title2,
              bodyWidget: body2,
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: title3,
              bodyWidget: body3,
              footer: Container(
                // height: 1,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      text: 'ابدا',
                      onClicked: () => Get.to(WelcomePage()),
                      // key: key!,
                    ),
                  ],
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          // showSkipButton: true,
          // skip: Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Text(
          //     'تخطى',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          onSkip: () => goToHome(context),
          // next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).bottomAppBarColor,
          skipFlex: 10,
          nextFlex: 60,
          dotsFlex: 20

          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
          ),
    );
  }

  // void goToHome(context) => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => HomePage()),
  //     );

  Widget buildImage(String path) => Center();

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xff4C7360),
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 49, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(44),
        pageColor: Colors.white,
      );
}

// TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
