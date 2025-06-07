import 'package:flutter/material.dart';

abstract class MyStyles {
  static const ButtonStyle buttonStyle = ButtonStyle(
    elevation: WidgetStatePropertyAll(4),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
  );
}
