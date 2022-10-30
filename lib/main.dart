import 'package:expense_project/welcome.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;
import 'package:flutter/services.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color.Colors.backgroundGreenColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
          indicatorColor: Colors.green,
          appBarTheme: AppBarTheme(color: const Color(0xffFFFFFF)),
          textTheme: TextTheme(
        // headline1: const TextStyle(fontFamily: 'Source Sans Pro', fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, fontSize: 40)
        headline1: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        headline4: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText2: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: color.Colors.disableColor),
        subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: color.Colors.greenColor),
      )),

      home: splash());
      // initialRoute: "/splash",
      // onGenerateRoute: (settings) {
      //   final arguments = settings.arguments;
      //   final arguments2 = settings.arguments;
      //   switch (settings.name) {
      //     case '/splash': //splash
      //       return MaterialPageRoute(builder: (_) => const splash());
      //     case '/WelcomePage':
      //       return MaterialPageRoute(builder: (_) => const WelcomePage());
      //     case '/HomePage':
      //       return MaterialPageRoute(
      //           builder: (_) => HomePage(
      //                 name: arguments, income: arguments2
      //               ));
      //     default:
      //       return null;
      //   }
      // },
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
    Future.delayed(const Duration(seconds: 1), () {
      _wrapper();
    });
  }

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

  _wrapper(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WelcomePage()));
  }
}
