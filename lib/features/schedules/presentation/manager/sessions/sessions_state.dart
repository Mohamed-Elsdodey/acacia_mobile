part of 'sessions_cubit.dart';

sealed class SessionsState extends Equatable {
  const SessionsState();
  @override
  List<Object> get props => [];
}

final class SessionsInitial extends SessionsState {}

final class SessionsLoading extends SessionsState {}

final class SessionsFailure extends SessionsState {
  final String errorMassage;

  const SessionsFailure(this.errorMassage);
}

final class SessionsSuccess extends SessionsState {
  final SessionsModel sessionsModel;

  const SessionsSuccess(this.sessionsModel);
}
