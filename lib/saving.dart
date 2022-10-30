import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;


class SavingPage extends StatelessWidget {
  const SavingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // height: 450,
              // width: 414,
              // margin: const EdgeInsets.only(bottom: 20),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              // decoration: BoxDecoration(
              //     color: color.Colors.backgroundColor,
              //     borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Saving Reat',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '10 %',
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
                    alignment: Alignment.centerLeft,
                    child: Text('Saving For This Month',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '100 SR',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Saving Data',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '2022-10-31',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    //CODE
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: color.Colors.backgroundGreenColor,
                    minimumSize:  Size.fromHeight(48),
                  ),
                ),
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}