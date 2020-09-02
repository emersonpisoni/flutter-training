import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextInputType keyboardType;
  String labelText;
  String labelTextValidator;
  TextEditingController controller;

  TextInputWidget({
    @required this.controller,
    @required this.labelText,
    this.keyboardType,
    this.labelTextValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey)),
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return labelTextValidator ?? 'required field';
        }
        return null;
      },
      controller: controller,
    );
  }
}
