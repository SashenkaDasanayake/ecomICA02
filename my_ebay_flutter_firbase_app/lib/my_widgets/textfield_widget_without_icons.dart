import 'package:flutter/material.dart';

class TextFieldWidgetWithoutIcons extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function onChanged;
  final bool enable;
  final bool autofocus;
  final TextEditingController textEditingController;
  final Color color;

  TextFieldWidgetWithoutIcons(
      {this.hintText,
      this.obscureText,
      this.onChanged,
      this.enable,
      this.autofocus,
      this.textEditingController,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: color,
      enabled: enable,
      autofocus: autofocus,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: color,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        focusColor: color,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        labelText: hintText,
        labelStyle: TextStyle(color: color),
        alignLabelWithHint: false,
        filled: true,
      ),
    );
  }
}
