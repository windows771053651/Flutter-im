import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String title, {Toast toastLength}) {
  Fluttertoast.showToast(
    msg: title,
    backgroundColor: Colors.transparent,
    textColor: Colors.black54,
    fontSize: 14,
    toastLength: toastLength,
  );
}