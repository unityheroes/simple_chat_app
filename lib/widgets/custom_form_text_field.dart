import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  final String textHint;
  bool obsecureText;
  Function(String)? onChange;
  CustomFormTextField({
    super.key,
    this.obsecureText = false,
    required this.onChange,
    required this.textHint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obsecureText,
        validator: _defaultValidator,
        style: const TextStyle(color: Colors.white),
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: textHint,
          hintStyle: const TextStyle(color: Colors.white),
          //labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.yellow)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white70),
          ),
        ));
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field is required.";
    }
    return null;
  }
}
