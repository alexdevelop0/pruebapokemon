import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AlertWidget {
  message(BuildContext context, String? message) {
    Flushbar(
      //title:  "",
      message: message.toString(),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  DateTime now = DateTime.now();
}
