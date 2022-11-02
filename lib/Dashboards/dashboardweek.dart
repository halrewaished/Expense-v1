import 'package:expense_project/Dashboards/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_project/Charts/linechartweek.dart';
import 'DashBoardDay.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:expense_project/main.dart';

class DashboardWeek extends StatefulWidget {
  @override
  State<DashboardWeek> createState() => _DashboardWeekState();
}

final benzene = GetStorage();
void mm(benzene) {
  benzene.write('Month', 5.0);
  benzene.write('Day', 6.0);
  benzene.write('Type', 'Food');
  benzene.write('Date', "DateTime.now()");
  benzene.write('Amount', 6.0);
}

var testval = 1;
var testmap = {"Food": 222};
var testmap2 = {testmap: "12-12-2012"};

class _DashboardWeekState extends State<DashboardWeek> {
  @override
  void initState() {
    mm(benzene);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(labelColor: Colors.black, tabs: [
          Tab(
            text: "الإنفاق",
          ),
          Tab(
            text: "المدخرات",
          ),
        ]),
      ),
      body: TabBarView(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xff37604C)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                BorderSide(color: Color(0xff37604C))))),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DefaultTabController(
                                length: 2, child: DashboardDay()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ));
                    },
                    child: Text("اليوم")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xff37604C)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                BorderSide(color: Color(0xff37604C))))),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DefaultTabController(
                                length: 2, child: DashboardWeek()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ));
                    },
                    child: Text("الأسبوع")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xff37604C)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                BorderSide(color: Color(0xff37604C))))),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DefaultTabController(length: 2, child: Dashboard()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ));
                    },
                    child: Text("الشهر")),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 170,
              width: 370,
              child: Card(
                child: LineChart(mainDataWeek(benzene)),
              ),
            ),
            SizedBox(
              height: 86,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "الأكثر إنفاقا",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Card(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: ListTile(
                                  title: Text(
                                    benzene.read('Type'),
                                  ),
                                  subtitle: Text(
                                    benzene.read('Date').toString(),
                                  ),
                                  leading: Icon(Icons.coffee),
                                  trailing: Text(
                                    benzene.read('Amount').toString(),
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  );
                }),
                itemCount: testmap2.length,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "إجمالي المدخرات",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 113,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "٢٢٤.٠٠٠",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff37604C)),
                    ),
                    Container(
                        width: 250,
                        height: 17,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff37604C)),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(250, 17)),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 57),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "مدخراتك خلال العام",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: testmap.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Card(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: ListTile(
                                  title: Text(
                                    testmap.keys.elementAt(index).toString(),
                                  ),
                                  subtitle: Text("12-03-2022"),
                                  leading: Icon(Icons.coffee),
                                  trailing: Text(
                                    testmap.values.elementAt(index).toString(),
                                    style: TextStyle(color: Color(0xff37604C)),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff37604C),
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff37604C),
        unselectedItemColor: Color(0xff37604C),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
        ],
      ),
    );
  }
}