import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/notifications_repo_impl.dart';
import '../manager/notifications/messagers_cubit.dart';
import '../widgets/messages_view_body.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});


  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessagesCubit(
        getIt.get<MessagesRepoImpl>(),
      )..getMessages(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              GoTo.pop(context);
            },
          ),
          title: Text(
            S.of(context).messages,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: MessagesViewBody(

        ),
      ),
    );
  }
}
