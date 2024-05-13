import 'package:flutter/material.dart';

class CustomChatMessage extends StatelessWidget {
  const CustomChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: const BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        child: const Text(
          "example asdas das dasd a",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
