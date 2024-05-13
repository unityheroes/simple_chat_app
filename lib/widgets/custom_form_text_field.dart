import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String textHint;
  Function(String)? onChange;
  CustomFormTextField({
    super.key,
    required this.onChange,
    required this.textHint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Field is required.";
          }
        },
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
}
