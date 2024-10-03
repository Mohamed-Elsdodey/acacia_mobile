part of 'data_account_cubit.dart';

sealed class DataAccountState extends Equatable {
  const DataAccountState();
  @override
  List<Object> get props => [];
}

final class DataAccountInitial extends DataAccountState {}

final class DataAccountLoading extends DataAccountState {}

final class DataAccountFailure extends DataAccountState {
  final String errorMassage;

  const DataAccountFailure(this.errorMassage);
}

final class DataAccountSuccess extends DataAccountState {
  final DataAccountModel dataAccountModel;

  const DataAccountSuccess(this.dataAccountModel);
}
