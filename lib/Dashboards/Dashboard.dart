import 'package:expense_project/Dashboards/forindexing.dart';
import 'package:expense_project/Model/extensions.dart';
import 'package:expense_project/page/home.dart';
import 'package:expense_project/page/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_project/Charts/linechart.dart';
import 'dashboardday.dart';
import 'dashboardweek.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:flutter_localizations/flutter_localizations.dart';
import '../Model/boxGetStorage.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/boxGetStorage.dart';
import '../Model/omniModel.dart';
import '../Model/GetxController.dart';

var testmap = {"Food": 222, "Coffe": 337, "Entertainment": 988};

List<Color> gradientColors = [
  const Color(0xff76A08C),
  const Color(0xff37604C),
];

class Dashboard extends StatelessWidget {
  String date = DateTime.now().toString().changeDateFormat();
  final TextEditingController expenses = TextEditingController();
  final OMNIController MonthController = Get.put(OMNIController());

  Dashboard({super.key});

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
                            MaterialStateProperty.all(Color(0xff4C7360)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Color(0xff4C7360))))),
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
                            MaterialStateProperty.all(Color(0xff4C7360)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Color(0xff4C7360))))),
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
                            MaterialStateProperty.all(Color(0xff4C7360)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Color(0xff4C7360))))),
                    onPressed: () {},
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
                child: LineChart(mainData(indexingg)),
              ),
            ),
            SizedBox(
              height: 51,
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
            SizedBox(
              height: 11,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: MonthController.DATA.length,
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
                                            MonthController.DATA[index].value),
                                        subtitle: Text(
                                            MonthController.DATA[index].date),
                                        leading: MonthController
                                                    .DATA[index].value ==
                                                "التسوق"
                                            ? Icon(
                                                Icons.shopping_basket_outlined)
                                            : MonthController
                                                        .DATA[index].value ==
                                                    "مطعم"
                                                ? Icon(Icons.restaurant)
                                                : MonthController.DATA[index]
                                                            .value ==
                                                        "كافيه"
                                                    ? Icon(
                                                        Icons.coffee_outlined)
                                                    : MonthController
                                                                .DATA[index]
                                                                .value ==
                                                            "الهدايا"
                                                        ? Icon(Icons
                                                            .card_giftcard_outlined)
                                                        : MonthController
                                                                    .DATA[index]
                                                                    .value ==
                                                                "وسائل النقل"
                                                            ? Icon(Icons
                                                                .emoji_transportation_outlined)
                                                            : Icon(Icons.menu),
                                        trailing: Text(
                                            "${MonthController.DATA[index].expenses}-",
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
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 44,
            ),
            SizedBox(
              width: 450,
              height: 164,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${MonthController.total}",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4C7360)),
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
                    itemCount: MonthController.DATA2.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(MonthController.DATA2[index].value),
                            subtitle: Text(MonthController.DATA2[index].date),
                            leading: MonthController.DATA2[index].value ==
                                    "التسوق"
                                ? Icon(Icons.shopping_basket_outlined)
                                : MonthController.DATA[index].value == "مطعم"
                                    ? Icon(Icons.restaurant)
                                    : MonthController.DATA[index].value ==
                                            "كافيه"
                                        ? Icon(Icons.coffee_outlined)
                                        : MonthController.DATA[index].value ==
                                                "الهدايا"
                                            ? Icon(Icons.card_giftcard_outlined)
                                            : MonthController
                                                        .DATA[index].value ==
                                                    "وسائل النقل"
                                                ? Icon(Icons
                                                    .emoji_transportation_outlined)
                                                : Icon(Icons.menu),
                            trailing: Text(
                                "${MonthController.DATA2[index].expenses}"),
                          )
                        ],
                      );
                    }),
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
