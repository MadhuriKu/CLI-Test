import 'package:cli_test/util/annimation_dialog.dart';
import 'package:flutter/material.dart';

class DialogManager {
  static final DialogManager _instance = DialogManager._internal();

  factory DialogManager() {
    return _instance;
  }

  DialogManager._internal();

  static DialogManager get instance => _instance;

  void showMessageDialog(
      BuildContext context, String title, String desc, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnnimationDialog(
            title: title, message: desc, buttontext: buttonText);
      },
    );
  }
}
