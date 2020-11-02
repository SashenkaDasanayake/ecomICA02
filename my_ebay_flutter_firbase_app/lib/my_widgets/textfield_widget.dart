import 'package:flutter/material.dart';

import '../globals.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final bool enable;
  final bool autofocus;
  final TextEditingController textEditingController;

  TextFieldWidget(
      {this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged,
      this.enable,
      this.autofocus,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: textEditingController,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Globals.mediumBlue,
      style: TextStyle(
        color: Globals.mediumBlue,
        fontSize: 14.0,
      ),
      enabled: enable,
      autofocus: autofocus,
      decoration: InputDecoration(

        labelStyle: TextStyle(color: Globals.mediumBlue),
        focusColor: Globals.mediumBlue,
        filled: true,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Globals.mediumBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Globals.mediumBlue),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurple[200]),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Globals.mediumBlue,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
//            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Globals.mediumBlue,
          ),
        ),
      ),
    );
  }
}
