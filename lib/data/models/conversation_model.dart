import 'package:chat_gpt_app/data/models/message_model.dart';
import 'package:chat_gpt_app/domain/entities/conversation_entity.dart';
import 'package:chat_gpt_app/domain/entities/message_entity.dart';
import 'package:equatable/equatable.dart';

class ConversationModel extends ConversationEntity with EquatableMixin {
  ConversationModel({
    required List<MessageEntity> messages,
    required String title,
    String? iconUrl,
  }) : super(messages: messages, title: title, iconUrl: iconUrl);

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      messages: (json['messages'] as List)
          .map((e) => MessageModel.fromJson(e))
          .toList(),
      title: json['title'],
      iconUrl: json['iconUrl'],
    );
  }
}
