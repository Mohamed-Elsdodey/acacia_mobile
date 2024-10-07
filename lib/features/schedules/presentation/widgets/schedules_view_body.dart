import 'package:evaluation_and_follow_up/core/widgets/custom_error_massage.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_loading_widget.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/schedules/data/models/schedules_model.dart';
import 'package:evaluation_and_follow_up/features/schedules/data/models/sessions_model.dart';
import 'package:evaluation_and_follow_up/features/schedules/presentation/manager/sessions/sessions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../generated/l10n.dart';
import '../manager/schedules/schedules_cubit.dart';
import 'custom_build_table.dart';

class SchedulesViewBody extends StatefulWidget {
  const SchedulesViewBody({super.key});

  @override
  State<SchedulesViewBody> createState() => _SchedulesViewBodyState();
}

class _SchedulesViewBodyState extends State<SchedulesViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.center,
            child: Text(
              S.of(context).schedules,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<SessionsCubit, SessionsState>(
            builder: (context, state) {
              if (state is SessionsSuccess) {
                if (state.sessionsModel.status == 401) {
                  return invalidToken(context);
                } else {
                  List<SessionItem> listSessions = state.sessionsModel.data!;
                  if (listSessions.isNotEmpty) {
                    return BlocBuilder<SchedulesCubit, SchedulesState>(
                      builder: (context, state) {
                        if (state is SchedulesSuccess) {
                          List<SchedulesModel> listSchedules =
                              state.listSchedules;
                          if (listSchedules.isNotEmpty) {
                            return Expanded(
                              child: CustomRefreshPage(
                                onRefresh: () async {
                                  await BlocProvider.of<SessionsCubit>(context)
                                      .getSessions();
                                  if (context.mounted) {
                                    await BlocProvider.of<SchedulesCubit>(
                                            context)
                                        .getSchedules();
                                  }
                                },
                                child: CustomBuildTable(
                                  listSchedules: listSchedules,
                                  listSessions: listSessions,
                                ),
                              ),
                            );
                          } else {
                            return Center(
                                child: Text(S.of(context).no_schedules));
                          }
                        } else if (state is SchedulesFailure) {
                          return CustomErrorMassage(
                              errorMassage: state.errorMassage);
                        } else {
                          return const CustomLoadingWidget();
                        }
                      },
                    );
                  } else {
                    return Center(child: Text(S.of(context).no_schedules));
                  }
                }
              } else if (state is SessionsFailure) {
                return CustomErrorMassage(errorMassage: state.errorMassage);
              } else {
                return const CustomLoadingWidget();
              }
            },
          )
        ],
      ),
    );
  }
}
