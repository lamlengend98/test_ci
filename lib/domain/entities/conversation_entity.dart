// conversations include multiple messages
import 'package:chat_gpt_app/domain/entities/message_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ConversationEntity extends Equatable {
  final List<MessageEntity> messages;
  final String title;

  const ConversationEntity(
      {required this.messages, required this.title, String? iconUrl});

  @override
  List<Object?> get props => [title];
}
