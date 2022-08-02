import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatModel with EquatableMixin {
  final String? sender;
  final String? getter;
  final bool? whoIsThis;
  final String? message;
  final Timestamp? date;

  ChatModel({this.sender, this.getter, this.whoIsThis, this.message, this.date});

  @override
  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'getter': getter,
      'whoIsThis': whoIsThis,
      'message': message,
      'date': date ?? FieldValue.serverTimestamp()
    };
  }

  ChatModel.fromMap(Map<String, dynamic> map)
      : sender = map['sender'],
        getter = map['getter'],
        whoIsThis = map['whoIsThis'],
        message = map['message'],
        date = map['date'];

  @override
  String toString() {
    return 'ChatModel{sender: $sender, getter: $getter, whoIsThis: $whoIsThis, message: $message, date: $date}';
  }

  @override
  List<Object?> get props => [sender, getter, whoIsThis, message, date];
}
