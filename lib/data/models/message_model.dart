import 'package:chat_gpt_app/domain/entities/message_entity.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends MessageEntity with EquatableMixin {
  MessageModel({
    required String senderId,
    required String content,
    required DateTime timestamp,
  }) : super(senderId: senderId, content: content, timestamp: timestamp);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
