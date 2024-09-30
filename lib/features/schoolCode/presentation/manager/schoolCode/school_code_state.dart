part of 'school_code_cubit.dart';

sealed class SchoolCodeState extends Equatable {
  const SchoolCodeState();
  @override
  List<Object> get props => [];
}

final class SchoolCodeInitial extends SchoolCodeState {}

final class SchoolCodeLoading extends SchoolCodeState {}

final class SchoolCodeFailure extends SchoolCodeState {
  final String errorMassage;

  const SchoolCodeFailure(this.errorMassage);
}

final class SchoolCodeSuccess extends SchoolCodeState {
  final SchoolCodeModel schoolCodeModel;

  const SchoolCodeSuccess(this.schoolCodeModel);
}
