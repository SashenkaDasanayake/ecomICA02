import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Globals {

  // Colors
  static const Color white = const Color(0xffffffff);
  static const Color mediumBlue = const Color(0xff4A64FE);
  static const Color appPink = const Color(0xffFF1493);

  void displaySnackBar(GlobalKey<ScaffoldState> scaffoldKey, String msg, int duration){
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: duration),
    ));
  }

  String getDateNow() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2101));

    if (picked != null && picked != DateTime.now()){
      return picked;
    } else {
      return DateTime.now();
    }
  }

  Color getColorCode(int colorCode){
    Color color = Colors.white;

    switch(colorCode){
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.green;
        break;
      case 3:
        color = Colors.black;
        break;
    }
    return color;
  }

  String getSizeCode(int colorCode){
    String sizeStr = "";

    switch(colorCode){
      case 0:
        sizeStr = "Small";
        break;
      case 1:
        sizeStr = "Medium";
        break;
      case 2:
        sizeStr = "Large";
        break;
    }
    return sizeStr;
  }

}
