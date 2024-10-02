part of 'exams_cubit.dart';

sealed class ExamsState extends Equatable {
  const ExamsState();
  @override
  List<Object> get props => [];
}

final class ExamsInitial extends ExamsState {}

final class ExamsLoading extends ExamsState {}

final class ExamsFailure extends ExamsState {
  final String errorMassage;

  const ExamsFailure(this.errorMassage);
}

final class ExamsSuccess extends ExamsState {
  final ExamsModel examsModel;

  const ExamsSuccess(this.examsModel);
}
