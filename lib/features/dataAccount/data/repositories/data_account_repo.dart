import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/data_account_model.dart';

abstract class DataAccountRepo {
  Future<Either<Failure, DataAccountModel>> upDateDataAccount({
    required String name,
    required String email,
    required String password,
  });
}
