import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String hintText;
  final IconData? iconData;

  final Color backgroundColor;
  final bool isObscure;
  final TextEditingController? textEditingController;
  final Function validator;

  const CustomTextField(
      {Key? key,
      required this.textInputAction,
      required this.textInputType,
      required this.hintText,
      this.iconData,
      this.backgroundColor = Colors.white,
      this.textEditingController,
      required this.validator,
      required this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: TextFormField(
        textInputAction: textInputAction,
        keyboardType: textInputType,
        cursorColor: Colors.purple,
        style: const TextStyle(color: Colors.black),
        textAlignVertical: TextAlignVertical.bottom,
        controller: textEditingController,
        decoration: __buildFieldDecoration(
          hint: hintText,
          icon: iconData,
        ),
        obscureText: isObscure,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }

  InputDecoration __buildFieldDecoration(
      {required String hint, IconData? icon}) {
    return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 10.0,
      ),
      hintStyle: const TextStyle(color: Colors.purple),
      hintText: hint,
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: Colors.purple,
            )
          : null,
    );
  }
}
