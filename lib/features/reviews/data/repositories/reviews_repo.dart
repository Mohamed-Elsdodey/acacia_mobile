import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/reviews_model.dart';

abstract class ReviewsRepo {
  Future<Either<Failure, ReviewsModel>> getReviews();
}
