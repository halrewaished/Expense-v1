import 'package:expense_project/Model/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/Model/colors.dart' as color;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/boxGetStorage.dart';
import '../Model/omniModel.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController income = TextEditingController();
  final TextEditingController name = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundGreenColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.width * 0.30,
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Logo.png',
                    height: 120,
                    width: 130,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      height: 389,
                      width: 382,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Text(
                            'قم بإدارة نفقاتك',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Noto',
                                color: color.Colors.backgroundGreenColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الإسم',
                              style: TextStyle(
                                  fontFamily: 'Noto',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 12,
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: color.Colors.backgroundGreenColor,
                                    width: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الراتب الشهري',
                              style: TextStyle(
                                  fontFamily: 'Noto',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 12,
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(
                                    '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$')),
                              ],
                              controller: income,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: color.Colors.backgroundGreenColor,
                                    width: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _btnSave,
                            style: ElevatedButton.styleFrom(
                              primary: color.Colors.backgroundGreenColor,
                              minimumSize: const Size.fromHeight(48),
                            ),
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                  fontFamily: 'Noto',
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validation() {
    return (name.text.trim() == "" || income.text.trim() == "");
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
   final model = OMNIModel(name: name.text.trim(), income: double.parse(income.text.trim()));
   await OMNI.shared.set(OMNI: model);
   Get.offAndToNamed('/TabBarPage');
  }
}
