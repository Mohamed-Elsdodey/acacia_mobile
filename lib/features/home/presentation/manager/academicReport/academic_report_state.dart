part of 'academic_report_cubit.dart';

sealed class AcademicReportState extends Equatable {
  const AcademicReportState();
  @override
  List<Object> get props => [];
}

final class AcademicReportInitial extends AcademicReportState {}

final class AcademicReportLoading extends AcademicReportState {}

final class AcademicReportFailure extends AcademicReportState {
  final String errorMassage;

  const AcademicReportFailure(this.errorMassage);
}

final class AcademicReportSuccess extends AcademicReportState {
  final AcademicReportModel academicReportModel;

  const AcademicReportSuccess(this.academicReportModel);
}
