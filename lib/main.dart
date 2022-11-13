import 'package:expense_project/page/tabbar.dart';
import 'package:expense_project/page/welcome.dart';
import 'package:expense_project/page1/home_page.dart';
import 'package:expense_project/page1/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:expense_project/page1/onboarding_page.dart';

import 'Model/boxGetStorage.dart';
import 'Model/omniModel.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color.Colors.backgroundGreenColor,
  ));
}

class MyApp extends StatelessWidget {
  static String? title;

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // home: OnBoardingPage(),
        textDirection: TextDirection.rtl,
        debugShowCheckedModeBanner: false,
        title: 'Expense App',
        theme: ThemeData(
            indicatorColor: Colors.green,
            appBarTheme: AppBarTheme(color: const Color(0xffFFFFFF)),
            textTheme: TextTheme(
              // headline1: const TextStyle(fontFamily: 'Source Sans Pro', fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, fontSize: 40)
              headline1: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
              headline4: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyText1: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText2: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              subtitle1: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: color.Colors.disableColor),
              subtitle2: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: color.Colors.greenColor),
            )),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const splash()),
          GetPage(name: '/Onboard', page: () => OnBoardingPage()),
          GetPage(name: '/WelcomePage', page: () => const WelcomePage()),
          GetPage(name: '/TabBarPage', page: () => const TabBarPage()),
        ]);
  }
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(OnBoardingPage());
      _wrapper();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundGreenColor,
      body: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          height: 136,
          width: 154,
        ),
      ),
    );
  }

  _wrapper() async {
    OMNIModel? omni = await OMNI.shared.get();
    if (omni != null) {
      Get.offAndToNamed('/TabBarPage');
    } else {
      Get.to(OnBoardingPage());
      // Get.offAndToNamed('/WelcomePage');
    }
  }
}
