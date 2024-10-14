import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/messages_model.dart';
import '../../../data/repositories/messages_repo.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.messagesRepo) : super(MessagesInitial());
  final MessagesRepo messagesRepo;
  Future<void> getMessages() async {
    emit(MessagesLoading());
    Either<Failure, MessagesModel> result =
        await messagesRepo.getMessages();
    result.fold((failure) {
      emit(MessagesFailure(failure.errorMassage));
    }, (result) {
      emit(MessagesSuccess(result));
    });
  }
}
