import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  double screenSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  double screenSafeAreaWidth(BuildContext context) {
    return MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
  }

  Color randomColor() => Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

  BorderRadius buildBorderRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(20), topLeft: Radius.circular(20));
  }

  bool isLightTheme() {
    return false;
  }

  String prepareLists(List<String> list) {
    String result = "";
    if (list.isNotEmpty) {
      for (var person in list) {
        result = result +
            person
                .toString()
                .split("/")[person.toString().split("/").length - 2] +
            ",";
      }
      result = result.substring(0, (result.length) - 1).replaceAll(",", "\n");
    } else {
      result = " - ";
    }
    return result;
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget button(String text, VoidCallback function){
      return ElevatedButton(
        style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Utils().isLightTheme()? Colors.black54:Colors.white24),
        ),
        child: Text(text),
        onPressed: function,
      );
    }


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Utils().isLightTheme()? Colors.white:Colors.black,
      content: Text("Would you like to change the App Theme?", style: TextStyle(color: Utils().isLightTheme()? Colors.black:Colors.white),),
      actions: [
        button("No", () => {Navigator.pop(context)}),
        button("Yes", () => {}),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
