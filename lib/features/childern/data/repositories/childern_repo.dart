import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/childern_model.dart';

abstract class ChildernRepo {
  Future<Either<Failure, ChildernModel>> getChildern();
}
