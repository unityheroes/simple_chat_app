import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  const CustomButton({super.key, required this.textButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          textButton,
        ),
      ),
    );
  }
}
