import 'package:flutter/material.dart';

Widget textField({
  TextAlignVertical? alignVertical = TextAlignVertical.top,
  TextAlign textAlign = TextAlign.start,
  required String hint,
  TextEditingController? controller,
}) {
  return TextFormField(
    textAlignVertical: alignVertical,
    textAlign: textAlign,
    controller: controller,
    style: TextStyle(fontSize: 15.0),

    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      hintText: hint,
    ),
  );
}
