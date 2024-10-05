part of 'summary_cubit.dart';

sealed class SummaryState extends Equatable {
  const SummaryState();
  @override
  List<Object> get props => [];
}

final class SummaryInitial extends SummaryState {}

final class SummaryLoading extends SummaryState {}

final class SummaryFailure extends SummaryState {
  final String errorMassage;

  const SummaryFailure(this.errorMassage);
}

final class SummarySuccess extends SummaryState {
  final SummaryModel summaryModel;

  const SummarySuccess(this.summaryModel);
}
