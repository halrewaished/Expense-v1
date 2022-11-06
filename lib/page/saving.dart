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
  @override
  String date = DateTime.now().toString().changeDateFormat();
  final TextEditingController expenses = TextEditingController();
  final TextEditingController saving = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final OMNIController Controller = Get.find();
  String? selectIndex = '10%';
  final itemsIndex = ['10%', '20%', '30%', '40%'];

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
                            value: selectIndex,
                            iconSize: 20,
                            icon: Icon(Icons.keyboard_arrow_down_sharp,
                                color: color.Colors.backgroundGreenColor),
                            isExpanded: true,
                            items: itemsIndex
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 16),
                                    )))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectIndex = item),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        child: TextFormField(
                          controller: expenses,
                          decoration: InputDecoration(
                            hintText: '100 SR',
                            border: OutlineInputBorder(),
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
                          onChanged: (item) => setState(() => date = item),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: _btnSave,
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
    Controller.DATA2.add(TESTMODEL2(
        value: saving.text.trim(),
        date: date,
        saving: double.parse(expenses.text.trim())));
    Get.back();
  }
}
