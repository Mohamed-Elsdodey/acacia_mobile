part of 'opinions_cubit.dart';

sealed class OpinionsState extends Equatable {
  const OpinionsState();
  @override
  List<Object> get props => [];
}

final class OpinionsInitial extends OpinionsState {}

final class OpinionsLoading extends OpinionsState {}

final class OpinionsFailure extends OpinionsState {
  final String errorMassage;

  const OpinionsFailure(this.errorMassage);
}

final class OpinionsSuccess extends OpinionsState {
  final OpinionsModel opinionsModel;

  const OpinionsSuccess(this.opinionsModel);
}
