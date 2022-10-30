import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;
import 'home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String name = "None";
  String income = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundGreenColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.width *
                0.30, //TRY TO CHANGE THIS **0.30** value to achieve your goal
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Logo.png',
                    height: 120,
                    width: 130,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 389,
                    width: 382,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Text(
                          'Manage Your Expenses',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: color.Colors.backgroundGreenColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'YOUR NAME',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 12,
                          child: TextFormField(
                            onChanged: (val) => setState(() => name = val),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: color.Colors.backgroundGreenColor,
                                  width: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'YOUR INCOME',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 12,
                          child: TextFormField(
                            onChanged: (val) => setState(() => income = val),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: color.Colors.backgroundGreenColor,
                                  width: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (BuildContext context) => HomePage(name: name, income: income)));
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: color.Colors.backgroundGreenColor,
                            minimumSize: const Size.fromHeight(48),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
