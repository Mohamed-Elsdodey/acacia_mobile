part of 'subject_report_cubit.dart';

sealed class SubjectReportState extends Equatable {
  const SubjectReportState();
  @override
  List<Object> get props => [];
}

final class SubjectReportInitial extends SubjectReportState {}

final class SubjectReportLoading extends SubjectReportState {}

final class SubjectReportFailure extends SubjectReportState {
  final String errorMassage;

  const SubjectReportFailure(this.errorMassage);
}

final class SubjectReportSuccess extends SubjectReportState {
  final SubjectReportModel subjectReportModel;

  const SubjectReportSuccess(this.subjectReportModel);
}
