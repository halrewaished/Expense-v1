import 'package:expense_project/tabBar.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'package:expense_project/colors.dart' as color;
import 'package:expense_project/models/transaction.dart';


class HomePage extends StatefulWidget {
  String name;
  String income;
  HomePage({Key? key, required this.name, required this.income})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: color.Colors.backgroundGreenColor,
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled:true,
              // useRootNavigator : false,
              builder: (BuildContext context) {

                return FractionallySizedBox(

                  child: TabBarPage(),
                  heightFactor: 0.75,
                );
              }
          );
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopSection(
                name: widget.name,
                income: widget.income,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              TransactionSection()
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: textStyle.bodyText1,
              ),
              Text(
                'See all',
                style: textStyle.subtitle2,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.fastfood_rounded, color: color.Colors.orangeColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Food ",
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                        Text("Today")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$450',
                          semanticsLabel: '14 April 2019',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.medical_information_rounded,
                    color: color.Colors.greenColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Medicine ",
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                        Text("Today")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$450',
                          semanticsLabel: '14 April 2019',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.shop, color: color.Colors.accentColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Clothes ",
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                        Text("Today")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$450',
                          semanticsLabel: '14 April 2019',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.house_rounded, color: randomColor()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "House ",
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                        Text("Today")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$450',
                          semanticsLabel: '14 April 2019',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.car_rental_rounded, color: randomColor()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Car Rental ",
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                        Text("Today")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$450',
                          semanticsLabel: '14 April 2019',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  String name;
  String income;

  TopSection({Key? key, required this.name, required this.income})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          color: color.Colors.backgroundColor,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 340,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topCenter,
          height: 240,
          width: 414,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.Colors.backgroundGreenColor,
                  color.Colors.greenColor,
                ],
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
                width: 120,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: color.Colors.backgroundColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Image.asset(
                    'assets/images/bell.png',
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$name',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: color.Colors.backgroundColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          width: 400,
          height: 180,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: color.Colors.backgroundGreenColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                height: 2,
                                fontSize: 16),
                          ),
                          Text(
                            '$income',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.pickerColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            '\$0',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Saving',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.pickerColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            "${double.parse(income) * 0.1}",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
