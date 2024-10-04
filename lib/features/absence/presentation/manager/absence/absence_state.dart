part of 'absence_cubit.dart';

sealed class AbsenceState extends Equatable {
  const AbsenceState();
  @override
  List<Object> get props => [];
}

final class AbsenceInitial extends AbsenceState {}

final class AbsenceLoading extends AbsenceState {}

final class AbsenceFailure extends AbsenceState {
  final String errorMassage;

  const AbsenceFailure(this.errorMassage);
}

final class AbsenceSuccess extends AbsenceState {
  final AbsenceModel absenceModel;

  const AbsenceSuccess(this.absenceModel);
}
