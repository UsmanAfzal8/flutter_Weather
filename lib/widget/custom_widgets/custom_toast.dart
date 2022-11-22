import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void successToast({required String message, int duration = 3}) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.green,
    );
  }

  static void errorToast({required String message, int duration = 4}) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.red,
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final SnackBar snackBar =
        SnackBar(content: Text(text), backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void successSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final SnackBar snackBar =
        SnackBar(content: Text(text), backgroundColor: Colors.green);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void alertDialogeBox({
    required BuildContext context,
    required String text,
  }) {
    showDialog(
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(text),
            //content: Text('Do you really want to delete?'),
          );
        });
  }
}
