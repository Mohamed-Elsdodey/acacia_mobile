import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/reviews_model.dart';
import '../../../data/repositories/reviews_repo.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.reviewsRepo) : super(ReviewsInitial());
  final ReviewsRepo reviewsRepo;
  Future<void> getReviews() async {
    emit(ReviewsLoading());
    Either<Failure, ReviewsModel> result = await reviewsRepo.getReviews();
    result.fold((failure) {
      emit(ReviewsFailure(failure.errorMassage));
    }, (result) {
      emit(ReviewsSuccess(result));
    });
  }
}
