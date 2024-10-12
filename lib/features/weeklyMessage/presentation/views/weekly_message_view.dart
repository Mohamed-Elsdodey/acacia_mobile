import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/weekly_message_repo_impl.dart';
import '../manager/weeklyMessage/weekly_message_cubit.dart';
import '../manager/weeks/weeks_cubit.dart';
import '../widgets/weekly_message_view_body.dart';

class WeeklyMessageView extends StatefulWidget {
  const WeeklyMessageView({super.key});

  @override
  State<WeeklyMessageView> createState() => _WeeklyMessageViewState();
}

class _WeeklyMessageViewState extends State<WeeklyMessageView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeeklyMessageCubit(
            getIt.get<WeeklyMessageRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => WeeksCubit(
            getIt.get<WeeklyMessageRepoImpl>(),
          )..getWeeks(
              month: DateFormat('yyyy-MM', 'en').format(DateTime.now())),
        ),
      ],
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
            S.of(context).weekly_message,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const WeeklyMessageViewBody(),
      ),
    );
  }
}
