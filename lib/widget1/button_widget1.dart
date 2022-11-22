import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  ButtonWidget({
    // required Key key,
    required this.text,
    required this.onClicked,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            // side: BorderSide(color: Colors.red)
          )),
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff4C7360)),
        ),
        onPressed: onClicked,
        // color: Theme.of(context).primaryColor,
        // shape: StadiumBorder(),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Container(
          margin: EdgeInsets.fromLTRB(74, 12, 74, 12),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
