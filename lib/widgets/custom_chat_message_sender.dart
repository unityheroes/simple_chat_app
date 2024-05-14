import 'package:flutter/material.dart';

class CustomChatMessageSender extends StatelessWidget {
  const CustomChatMessageSender({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
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
