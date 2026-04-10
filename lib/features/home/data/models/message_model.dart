import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String email;
  final String message;
  final DateTime date;

  MessageModel({
    required this.email,
    required this.message,
    required this.date,
  });

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      email: jsonData['email'],
      message: jsonData['message'],
      date: (jsonData['date'] as Timestamp).toDate(),
    );
  }
}
