import 'package:chat_gpt_app/domain/entities/message_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class MessageRepository {
  Future<Either<Failure, MessageEntity>> sendMesage();
}
