part of 'schedules_cubit.dart';

sealed class SchedulesState extends Equatable {
  const SchedulesState();
  @override
  List<Object> get props => [];
}

final class SchedulesInitial extends SchedulesState {}

final class SchedulesLoading extends SchedulesState {}

final class SchedulesFailure extends SchedulesState {
  final String errorMassage;

  const SchedulesFailure(this.errorMassage);
}

final class SchedulesSuccess extends SchedulesState {
  final List<SchedulesModel> listSchedules;

  const SchedulesSuccess(this.listSchedules);
}
