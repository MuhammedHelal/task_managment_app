import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, required Color color}) async {
  await Fluttertoast.cancel();
  await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
