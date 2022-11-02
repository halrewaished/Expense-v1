import 'dart:math';
import 'package:expense_project/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/boxGetStorage.dart';
import '../Model/omniModel.dart';
import '../Model/GetxController.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  Future<OMNIModel?> omni = OMNI.shared.get();

  @override
  Widget build(BuildContext context) {
    setState(() {
      Controller.buildTotal();
    });
    return FutureBuilder<OMNIModel?>(
        future: omni,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            OMNIModel? test = snapshot.data;
            return SingleChildScrollView(
                child: Column(
              children: [omnni(test), ymm(test)],
            ));
          } else {
            return const SizedBox();
          }
        });
  }

  Widget omnni(test) {
    return Stack(
      children: [
        Container(
          color: color.Colors.backgroundColor,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 340,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          height: 240,
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
              const SizedBox(
                height: 22,
                width: 120,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'مرحبـًا',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: color.Colors.backgroundColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
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
                      test!.name!,
                      style: TextStyle(
                          fontFamily: 'Noto',
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
          top: 140,
          left: 10,
          width: 400,
          height: 190,
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
                            'إجمالي الرصيد',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                height: 2,
                                fontSize: 20),
                          ),
                          Text(
                            "${test.income}",
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ),
                      IconButton(
                        color: color.Colors.backgroundColor,
                        onPressed: () => Get.to(WelcomePage()),
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'المصروفـات',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: color.Colors.pickerColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            "${Controller.total2}",
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: color.Colors.backgroundColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'المدخـرات',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: color.Colors.pickerColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            "${Controller.total}",
                            style: TextStyle(
                                fontFamily: 'Noto',
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

  final OMNIController Controller = Get.put(OMNIController());

  Widget ymm(test) {
    var textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'النشاط الأخير',
                style: TextStyle(
                    fontFamily: 'Noto',
                    color: color.Colors.disableColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: Controller.DATA.length,
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
                                    title: Text(Controller.DATA[index].value),
                                    subtitle: Text(Controller.DATA[index].date),
                                    leading: Controller.DATA[index].value ==
                                            "التسوق"
                                        ? Icon(Icons.shopping_basket_outlined)
                                        : Controller.DATA[index].value == "مطعم"
                                            ? Icon(Icons.restaurant)
                                            : Controller.DATA[index].value ==
                                                    "كافيه"
                                                ? Icon(Icons.coffee_outlined)
                                                : Controller.DATA[index]
                                                            .value ==
                                                        "الهدايا"
                                                    ? Icon(Icons
                                                        .card_giftcard_outlined)
                                                    : Controller.DATA[index]
                                                                .value ==
                                                            "وسائل النقل"
                                                        ? Icon(Icons
                                                            .emoji_transportation_outlined)
                                                        : Icon(Icons.menu),
                                    trailing: Text(
                                        "${Controller.DATA[index].expenses}-",
                                        style: TextStyle(color: color.Colors.redColor)),
                                  ))
                            ],
                          )),
                    ],
                  );
                }),
              )),
        ],
      ),
    );
  }
}
