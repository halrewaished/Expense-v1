import 'package:expense_project/saving.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'expense.dart';
import 'package:expense_project/colors.dart' as color;

import 'home.dart';



class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
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
          appBar: AppBar(
            backgroundColor: color.Colors.backgroundColor,
            centerTitle: true,
            bottom: TabBar(
              labelColor: color.Colors.disableColor,
              unselectedLabelColor: color.Colors.pickerColor,
              labelStyle: TextStyle(
                  fontFamily: 'SF Pro Text',
                  color: color.Colors.disableColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              tabs: [
                Tab(text: 'Expense'),
                Tab(text: 'Saving'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ExpensePage(),
              SavingPage(),
            ],
          )
      )
  );
}