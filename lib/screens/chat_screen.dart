import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_chat_app/constants.dart';
import 'package:simple_chat_app/models/message_model.dart';
import 'package:simple_chat_app/widgets/custom_chat_message_receiver.dart';

import 'package:simple_chat_app/widgets/custom_chat_message_sender.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  bool isLoading = true;
  static String id = "ChatPage";
  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAtDoc, descending: true).snapshots(),
      builder: (context, snapshot) {
        List<MessageModel> listMessages = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listMessages.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          isLoading = false;

          return Scaffold(
              appBar: AppBar(
                title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    reverse: true,
                    controller: _controller,
                    itemCount: listMessages.length,
                    itemBuilder: (context, index) {
                      return email == listMessages[index].id
                          ? CustomChatMessageSender(
                              message: listMessages[index].message)
                          : CustomChatMessageReceiver(
                              message: listMessages[index].message);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                        controller: controller,
                        onSubmitted: (value) {
                          messages.add({
                            kMessageDoc: value,
                            kCreatedAtDoc: DateTime.now(),
                            kIdDoc: email
                          });
                          controller.clear();
                          _controller.animateTo(0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blueAccent)),
                            suffixIcon: const Icon(
                              Icons.send,
                              color: kBackgroundColor,
                            ),
                            hintText: "Send Message"))),
              ]));
        } else {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: const Scaffold(),
          );
        }
      },
    );
  }
}
