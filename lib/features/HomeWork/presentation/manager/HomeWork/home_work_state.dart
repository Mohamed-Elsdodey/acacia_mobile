part of 'home_work_cubit.dart';

sealed class HomeWorkState extends Equatable {
  const HomeWorkState();
  @override
  List<Object> get props => [];
}

final class HomeWorkInitial extends HomeWorkState {}

final class HomeWorkLoading extends HomeWorkState {}

final class HomeWorkFailure extends HomeWorkState {
  final String errorMassage;

  const HomeWorkFailure(this.errorMassage);
}
final class HomeWorkDaysLoading extends HomeWorkState {
}

final class HomeWorkSuccess extends HomeWorkState {
  final HomeWorkModel homeWorkModel;

  const HomeWorkSuccess(this.homeWorkModel);
}

final class HomeWorkDaysUpdated extends HomeWorkState {
  final List<String> days;  // الأيام الجديدة

  const HomeWorkDaysUpdated(this.days);
}
