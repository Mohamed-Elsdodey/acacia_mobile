import 'package:evaluation_and_follow_up/features/schedules/presentation/manager/schedules/schedules_cubit.dart';
import 'package:evaluation_and_follow_up/features/schedules/presentation/manager/sessions/sessions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../../notifications/presentation/views/notifications_view.dart';
import '../../data/repositories/schedules_repo_impl.dart';
import '../widgets/schedules_view_body.dart';

class SchedulesView extends StatefulWidget {
  const SchedulesView({super.key});

  @override
  State<SchedulesView> createState() => _SchedulesViewState();
}

class _SchedulesViewState extends State<SchedulesView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SchedulesCubit(
            getIt.get<SchedulesRepoImpl>(),
          )..getSchedules(),
        ),
        BlocProvider(
          create: (context) => SessionsCubit(
            getIt.get<SchedulesRepoImpl>(),
          )..getSessions(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            S.of(context).classes,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                GoTo.push(context, const NotificationsView());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 24.r),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppAssets.notification,
                      color: Colors.white,
                    ),
                    PositionedDirectional(
                      top: -2,
                      start: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4.r,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: const SchedulesViewBody()),
      ),
    );
  }
}
