part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();
  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsFailure extends ReviewsState {
  final String errorMassage;

  const ReviewsFailure(this.errorMassage);
}

final class ReviewsSuccess extends ReviewsState {
  final ReviewsModel reviewsModel;

  const ReviewsSuccess(this.reviewsModel);
}
