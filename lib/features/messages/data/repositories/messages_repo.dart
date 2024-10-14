import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/messages_model.dart';

abstract class MessagesRepo {
  Future<Either<Failure, MessagesModel>> getMessages();
}
