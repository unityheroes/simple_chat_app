import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_chat_app/constants.dart';
import 'package:simple_chat_app/widgets/custom_chat_message.dart';

class ChatPage extends StatelessWidget {
  static String id = "ChatPage";

  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage(kLogoImage),
              height: 64,
            ),
            Text(
              "Simple Chat app",
              style: TextStyle(color: Colors.white),
            ),
          ]),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomChatMessage();
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      suffixIcon: const Icon(
                        Icons.send,
                        color: kBackgroundColor,
                      ),
                      hintText: "Send Message"))),
        ]));
  }
}
