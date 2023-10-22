import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class MessageEntity extends Equatable {
  final String content;
  final DateTime timestamp;
  // sender id
  final String senderId;

  MessageEntity(
      {required this.content, required this.senderId, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [timestamp];
}
