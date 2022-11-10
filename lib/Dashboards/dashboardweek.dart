import 'package:expense_project/Dashboards/Dashboard.dart';
import 'package:expense_project/Model/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_project/Charts/linechartweek.dart';
import '../Model/GetxController.dart';
import 'DashBoardDay.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:expense_project/main.dart';
import 'forindexingweek.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:expense_project/Dashboards/forindexingweek.dart';

class DashboardWeek extends StatefulWidget {
  @override
  State<DashboardWeek> createState() => _DashboardWeekState();
}

class _DashboardWeekState extends State<DashboardWeek> {
  String date = DateTime.now().toString().changeDateFormat();
  final TextEditingController expenses = TextEditingController();
  final OMNIController WeekController = Get.put(OMNIController());

  @override
  void initState() {}

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
                child: LineChart(mainDataWeek(indexingg)),
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
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: WeekController.DATA.length,
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
                                            WeekController.DATA[index].value),
                                        subtitle: Text(
                                            WeekController.DATA[index].date),
                                        leading: WeekController
                                                    .DATA[index].value ==
                                                "التسوق"
                                            ? Icon(
                                                Icons.shopping_basket_outlined)
                                            : WeekController
                                                        .DATA[index].value ==
                                                    "مطعم"
                                                ? Icon(Icons.restaurant)
                                                : WeekController.DATA[index]
                                                            .value ==
                                                        "كافيه"
                                                    ? Icon(
                                                        Icons.coffee_outlined)
                                                    : WeekController.DATA[index]
                                                                .value ==
                                                            "الهدايا"
                                                        ? Icon(Icons
                                                            .card_giftcard_outlined)
                                                        : WeekController
                                                                    .DATA[index]
                                                                    .value ==
                                                                "وسائل النقل"
                                                            ? Icon(Icons
                                                                .emoji_transportation_outlined)
                                                            : Icon(Icons.menu),
                                        trailing: Text(
                                            "${WeekController.DATA[index].expenses}-",
                                            style: TextStyle(
                                                color: color.Colors.redColor)),
                                      ))
                                ],
                              )),
                        ],
                      );
                    }),
                  )),
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
                      WeekController.total.toString(),
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
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: WeekController.DATA2.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(WeekController.DATA2[index].value),
                            subtitle: Text(WeekController.DATA2[index].date),
                            leading: WeekController.DATA2[index].value ==
                                    "التسوق"
                                ? Icon(Icons.shopping_basket_outlined)
                                : WeekController.DATA[index].value == "مطعم"
                                    ? Icon(Icons.restaurant)
                                    : WeekController.DATA[index].value ==
                                            "كافيه"
                                        ? Icon(Icons.coffee_outlined)
                                        : WeekController.DATA[index].value ==
                                                "الهدايا"
                                            ? Icon(Icons.card_giftcard_outlined)
                                            : WeekController
                                                        .DATA[index].value ==
                                                    "وسائل النقل"
                                                ? Icon(Icons
                                                    .emoji_transportation_outlined)
                                                : Icon(Icons.menu),
                            trailing:
                                Text("${WeekController.DATA2[index].expenses}"),
                          )
                        ],
                      );
                    }),
                  )),
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
