part of 'weekly_message_cubit.dart';

sealed class WeeklyMessageState extends Equatable {
  const WeeklyMessageState();
  @override
  List<Object> get props => [];
}

final class WeeklyMessageInitial extends WeeklyMessageState {}

final class WeeklyMessageLoading extends WeeklyMessageState {}

final class WeeklyMessageFailure extends WeeklyMessageState {
  final String errorMassage;

  const WeeklyMessageFailure(this.errorMassage);
}

final class WeeklyMessageSuccess extends WeeklyMessageState {
  final WeeklyMessageModel weeklyMessageModel;

  const WeeklyMessageSuccess(this.weeklyMessageModel);
}
