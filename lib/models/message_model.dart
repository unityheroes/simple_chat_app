import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_chat_app/constants.dart';

class MessageModel {
  final String message;
  final Timestamp createdAt;
  final String id;

  MessageModel(
      {required this.message, required this.createdAt, required this.id});
  factory MessageModel.fromJson(jesondata) {
    return MessageModel(
        message: jesondata[kMessageDoc],
        createdAt: jesondata[kCreatedAtDoc],
        id: jesondata[kIdDoc]);
  }
}
