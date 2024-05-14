import 'package:flutter/material.dart';

class CustomChatMessageReceiver extends StatelessWidget {
  const CustomChatMessageReceiver({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Text(
          DateTime.now().toString(),
          style: const TextStyle(fontSize: 8),
        )
      ]),
    );
  }
}
