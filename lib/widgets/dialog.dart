import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DialogUtils {
  static void showErrorMessage(BuildContext context, String errorMessage,
      {Color backColor = Colors.blue,
      Color textColor = Colors.black,
      Function? onOk}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: backColor,
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        //style: TextStyle(fontFamily: GlobalUI.FONT_MEDIUM, color: textColor),
      ),
    );
    // show the dialog
    if (onOk != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      ).then((val) {
        onOk();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: Colors.blue.shade600, size: 50),
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void toastMessage(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
