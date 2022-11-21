import 'package:expense_project/Model/extensions.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/omniModel.dart';
import '../Model/GetxController.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String date = DateTime.now().toString().changeDateFormat();
  double month = double.parse(DateTime.now().day.toString());
  double day = double.parse(DateTime.now().hour.toString());
  double week = double.parse(DateTime.now().weekday.toString());
  double year = double.parse(DateTime.now().year.toString());
  final TextEditingController expenses = TextEditingController();
  final items = ['التسوق', 'مطعم', 'كافيه', 'الهدايا', 'وسائل النقل'];

  String? selectedItem = 'التسوق';
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
                        child: Text('اختر تصنيف',
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
                            value: selectedItem,
                            iconSize: 20,
                            icon: Icon(Icons.keyboard_arrow_down_sharp,
                                color: color.Colors.backgroundGreenColor),
                            isExpanded: true,
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 16),
                                    )))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem = item),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('ادخل المبلغ المنفق',
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
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$')),
                          ],
                          controller: expenses,
                          decoration: InputDecoration(
                            hintText: '100 SR',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: color.Colors.backgroundGreenColor),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('يوم الانفاق',
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
                          onChanged: (item) => setState(
                            () => date = item,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: color.Colors.backgroundGreenColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: _btnSave,
                          child: Text(
                            'إضـافة',
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: color.Colors.backgroundGreenColor,
                            minimumSize: Size.fromHeight(48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  bool _validation() {
    return (expenses.text.trim() == "");
  }

  _btnSave() async {
    _formKey.currentState!.save();
    if (_validation()) {
      Get.customSnackbar(
        title: "خطأ",
        message: "الرجاء إدخال كافة الحقول",
        isError: true,
      );
      return;
    }
    Controller.DATA.add(TESTMODEL(
        value: selectedItem!,
        date: date,
        month: double.parse(DateTime.parse(date).month.toString()),
        day: double.parse(DateTime.parse(date).day.toString()),
        week: double.parse(DateTime.parse(date).weekday.toString()),
        year: double.parse(DateTime.parse(date).year.toString()),
        expenses: double.parse(expenses.text.trim())));

    Get.back();
  }
}
