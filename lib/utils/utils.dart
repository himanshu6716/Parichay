import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      fontSize: 30,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        message: message,
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(10),
        title: 'Alert',
        messageColor: Colors.white,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 10,
        duration: Duration(seconds: 3),
        icon: Icon(
          Icons.error,
          size:18,
          color: Colors.white,
        ),
      )..show(context),
    );
  }
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
