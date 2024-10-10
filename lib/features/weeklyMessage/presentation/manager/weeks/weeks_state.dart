part of 'weeks_cubit.dart';

sealed class WeeksState extends Equatable {
  const WeeksState();
  @override
  List<Object> get props => [];
}

final class WeeksInitial extends WeeksState {}

final class WeeksLoading extends WeeksState {}

final class WeeksFailure extends WeeksState {
  final String errorMassage;

  const WeeksFailure(this.errorMassage);
}

final class WeeksSuccess extends WeeksState {
  final WeeksModel weeksModel;

  const WeeksSuccess(this.weeksModel);
}
