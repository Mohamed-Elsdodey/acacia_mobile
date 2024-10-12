import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/notifications_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsModel>> getNotifications(
      {int? studentId});
}
