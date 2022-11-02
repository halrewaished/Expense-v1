import 'package:expense_project/page/expenses.dart';
import 'package:expense_project/page/saving.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;


class show extends StatefulWidget {
  const show({Key? key}) : super(key: key);

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: color.Colors.backgroundColor,
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
              tabs: const [
                Tab(text: 'الإنفـاق'),
                Tab(text: 'المدخـرات'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ExpensePage(),
              SavingPage(),
            ],
          )));
}
