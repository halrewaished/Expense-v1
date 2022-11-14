import 'package:expense_project/Model/extensions.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/GetxController.dart';
import '../Model/omniModel.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({Key? key}) : super(key: key);

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  String date = DateTime.now().toString().changeDateFormat();

  // final TextEditingController expenses = TextEditingController();
  // final TextEditingController saving = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final OMNIController Controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("اخـتر نسـبة الإدخـار",
                            style: TextStyle(
                                fontFamily: 'Noto',
                                height: 3,
                                color: color.Colors.disableColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: color.Colors.backgroundGreenColor),
                              ),
                            ),
                            value: 'اخـتر نسبـة الإدخـار',
                            iconSize: 20,
                            icon: Icon(Icons.keyboard_arrow_down_sharp,
                                color: color.Colors.backgroundGreenColor),
                            isExpanded: true,
                            items: Controller.itemsList
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 16),
                                    )))
                                .toList(),
                            // onChanged: (item) {
                            //   Controller.calcRating(item);
                            // }

                            onChanged: (item) => setState(() {
                              Controller.calcRating(item);
                            }),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('مبلغ الإدخار لهذا الشهر',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                height: 3,
                                color: color.Colors.disableColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 12,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 15),
                              child: Text('${Controller.income2} ريال '),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('يوم الإدخار',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                height: 3,
                                color: color.Colors.disableColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        child: TextFormField(
                          initialValue:
                              DateTime.now().toString().changeDateFormat(),
                          // onChanged: (item) {
                          //   Controller.date = item;
                          // },
                          onChanged: (item) => setState(() {
                            Controller.date = item;
                          }),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            _btnSave();
                            Controller.buildTotal();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color.Colors.backgroundGreenColor,
                            minimumSize: Size.fromHeight(48),
                          ),
                          child: const Text(
                            'إضـافة',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // bool _validation() {
  //   return (Controller.selectItem == 'اخـتر نسبـة الإدخـار');
  // }

  _btnSave() {
    // _formKey.currentState!.save();
    // if (_validation()) {
    //   Get.customSnackbar(
    //     title: "خطأ",
    //     message: "الرجاء إدخال كافة الحقول",
    //     isError: true,
    //   );
    //   return;
    // }
    Controller.DATA2.add(SAVINGMODEL(
      value: Controller.selectItem!,
      date: Controller.date,
      // textSaving: Controller.income2.toString(),
    ));
    Get.back();
  }
}
