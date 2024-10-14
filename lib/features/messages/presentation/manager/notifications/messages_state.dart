part of 'messagers_cubit.dart';

sealed class MessagesState extends Equatable {
  const MessagesState();
  @override
  List<Object> get props => [];
}

final class MessagesInitial extends MessagesState {}

final class MessagesLoading extends MessagesState {}

final class MessagesFailure extends MessagesState {
  final String errorMassage;

  const MessagesFailure(this.errorMassage);
}

final class MessagesSuccess extends MessagesState {
  final MessagesModel messagesModel;

  const MessagesSuccess(this.messagesModel);
}
