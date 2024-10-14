import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/messages_model.dart';
import '../manager/notifications/messagers_cubit.dart';
import 'messages_list_item.dart';

class MessagesViewBody extends StatefulWidget {
  const MessagesViewBody();

  @override
  State<MessagesViewBody> createState() => _MessagesViewBodyState();
}

class _MessagesViewBodyState extends State<MessagesViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<MessagesCubit>(context).getMessages();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: BlocBuilder<MessagesCubit, MessagesState>(
            builder: (context, state) {
              if (state is MessagesSuccess) {
                if (state.messagesModel.status == 401) {
                  return invalidToken(context);
                } else if (state.messagesModel.status == 403) {
                  return Center(child: Text(state.messagesModel.message![0]));
                } else {
                  List<MessageData>? listMessages = state.messagesModel.data;

                  if (listMessages!.isNotEmpty) {
                    return Column(
                      children: [
                        ...List.generate(
                          listMessages.length,
                          (index) {
                            return MessagesListItem(
                              messageData: listMessages[index],
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.r),
                      child:
                          Center(child: Text(S.of(context).no_messages)),
                    );
                  }
                }
              } else if (state is MessagesFailure) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: CustomErrorMassage(errorMassage: state.errorMassage),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: const CustomLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
