import 'package:expense_project/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;

import 'Dashboard.dart';
import 'home.dart';


class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: color.Colors.backgroundGreenColor,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TabBarPage()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage(name: "name", income: "income")));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DefaultTabController(length: 2, child: Dashboard())));
              break;
          }
        }),
        selectedItemColor: color.Colors.greenColor,
        unselectedItemColor: color.Colors.disableColor,
        iconSize: 25,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Chart'),
        ],
      ),
    );
  }
}