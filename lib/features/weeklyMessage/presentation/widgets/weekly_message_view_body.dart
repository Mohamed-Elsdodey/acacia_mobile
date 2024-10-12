import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evaluation_and_follow_up/features/weeklyMessage/presentation/manager/weeklyMessage/weekly_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_refresh_page.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../data/models/weekly_message_model.dart';
import '../../data/models/weeks_model.dart';
import '../manager/weeks/weeks_cubit.dart';

class WeeklyMessageViewBody extends StatefulWidget {
  const WeeklyMessageViewBody({super.key});

  @override
  State<WeeklyMessageViewBody> createState() => _WeeklyMessageViewBodyState();
}

class _WeeklyMessageViewBodyState extends State<WeeklyMessageViewBody> {
  String selectedMonth = DateFormat.MMMM('ar').format(DateTime.now());
  String? selectedWeek;
  WeekItem? currentWeek;
  List<WeekItem>? listWeeks;
  String? monthFinal;

  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        selectedMonth = DateFormat.MMMM('ar').format(DateTime.now());
        await BlocProvider.of<WeeksCubit>(context).getWeeks(
            month: DateFormat('yyyy-MM', 'en').format(DateTime.now()));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocConsumer<WeeksCubit, WeeksState>(
            listener: (context, state) {
              if (state is WeeksSuccess) {
                if (state.weeksModel.status == 401) {
                  CustomAlertDialog.alertWithButton(
                      context: context,
                      type: AlertType.error,
                      title: S.of(context).warning,
                      desc: S.of(context).warning_massge,
                      isCloseButton: false,
                      isOverlayTapDismiss: false,
                      onPressed: () {
                        GoTo.pushAndRemoveUntil(context, const LoginView());
                      });
                } else if (state.weeksModel.status == 403) {
                  CustomAlertDialog.alertWithButton(
                    context: context,
                    type: AlertType.error,
                    title: S.of(context).error,
                    desc: state.weeksModel.message![0],
                    isCloseButton: false,
                    isOverlayTapDismiss: false,
                  );
                } else {
                  setState(() {
                    listWeeks = state.weeksModel.data!;
                    currentWeek = listWeeks!.firstWhere(
                        (element) => element.isCurrent == 1,
                        orElse: () => WeekItem(
                            title: "",
                            endWeekDate: "",
                            isCurrent: -1,
                            startWeekDate: "",
                            weekNumber: -1));

                    int month = months.indexOf(selectedMonth) + 1;
                    if (month >= 1 && month <= 9) {
                      monthFinal = "${DateTime.now().year}-0$month";
                    } else {
                      monthFinal = "${DateTime.now().year}-$month";
                    }
                  });

                  if (currentWeek!.title != "" &&
                      currentWeek!.endWeekDate != "" &&
                      currentWeek!.startWeekDate != "" &&
                      currentWeek!.isCurrent != -1 &&
                      currentWeek!.weekNumber != -1) {
                    BlocProvider.of<WeeklyMessageCubit>(context)
                        .getWeeklyMessage(
                            month: monthFinal!,
                            weekNumber: currentWeek!.weekNumber!.toString(),
                            startWeek: currentWeek!.startWeekDate!.toString(),
                            endWeek: currentWeek!.endWeekDate!.toString());
                  }
                }
              } else if (state is WeeksFailure) {
                CustomAlertDialog.alertWithButton(
                    context: context,
                    type: AlertType.error,
                    title: S.of(context).error,
                    desc: state.errorMassage,
                    isCloseButton: false,
                    isOverlayTapDismiss: false,
                    onPressed: () {
                      GoTo.pushAndRemoveUntil(context, const LoginView());
                    });
              }
            },
            builder: (context, state) {
              if (state is WeeksLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: CustomLoadingWidget(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8),
                                  child: Text(
                                    S.of(context).choose_maoth,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                  child: CustomDropdown<String>(
                                    initialItem: selectedMonth,
                                    closedHeaderPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                    decoration: const CustomDropdownDecoration(
                                      headerStyle: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      closedFillColor: Colors.transparent,
                                    ),
                                    items: List.generate(
                                      months.length,
                                      (index) => months[index],
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMonth = value!;

                                        int month =
                                            months.indexOf(selectedMonth) + 1;
                                        if (month >= 1 && month <= 9) {
                                          monthFinal =
                                              "${DateTime.now().year}-0$month";
                                        } else {
                                          monthFinal =
                                              "${DateTime.now().year}-$month";
                                        }
                                      });

                                      BlocProvider.of<WeeksCubit>(context)
                                          .getWeeks(month: monthFinal!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8),
                                  child: Text(
                                    S.of(context).choose_week,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                  child: CustomDropdown<String>(
                                    hintText: S.of(context).choose_week,
                                    initialItem: currentWeek!.title != "" &&
                                            currentWeek!.endWeekDate != "" &&
                                            currentWeek!.startWeekDate != "" &&
                                            currentWeek!.isCurrent != -1 &&
                                            currentWeek!.weekNumber != -1
                                        ? currentWeek!.title
                                        : null,
                                    closedHeaderPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                    decoration: const CustomDropdownDecoration(
                                      headerStyle: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      closedFillColor: Colors.transparent,
                                    ),
                                    items: List.generate(
                                      listWeeks!.length,
                                      (index) => listWeeks![index].title!,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedWeek = value!;
                                        currentWeek = listWeeks!.firstWhere(
                                          (element) => element.title == value,
                                          orElse: () {
                                            return listWeeks![0];
                                          },
                                        );
                                      });

                                      BlocProvider.of<
                                              WeeklyMessageCubit>(context)
                                          .getWeeklyMessage(
                                              month: monthFinal!,
                                              weekNumber: currentWeek!
                                                  .weekNumber!
                                                  .toString(),
                                              startWeek: currentWeek!
                                                  .startWeekDate!
                                                  .toString(),
                                              endWeek: currentWeek!.endWeekDate!
                                                  .toString());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<WeeklyMessageCubit, WeeklyMessageState>(
                        builder: (context, state) {
                          if (state is WeeklyMessageSuccess) {
                            if (state.weeklyMessageModel.status == 401) {
                              return invalidToken(context);
                            } else if (state.weeklyMessageModel.status == 403) {
                              return Center(
                                  child: Text(
                                      state.weeklyMessageModel.message![0]));
                            } else {
                              List<WeekData> listData =
                                  state.weeklyMessageModel.data!;

                              return currentWeek!.title != "" &&
                                      currentWeek!.endWeekDate != "" &&
                                      currentWeek!.startWeekDate != "" &&
                                      currentWeek!.isCurrent != -1 &&
                                      currentWeek!.weekNumber != -1
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 48,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: BorderDirectional(
                                                          end: BorderSide(
                                                    color: Colors.grey.shade400,
                                                  ))),
                                                  child: Text(
                                                    S.of(context).sub_opinion,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 48,
                                                    child: Text(
                                                      S.of(context).opinions,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ...List.generate(
                                            listData.length,
                                            (index) {
                                              WeekData data = listData[index];
                                              return Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  color: index.isOdd
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(.1),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 48,
                                                      alignment:
                                                          Alignment.center,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 2,
                                                          horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          border:
                                                              BorderDirectional(
                                                                  end:
                                                                      BorderSide(
                                                        color: Colors
                                                            .grey.shade400,
                                                      ))),
                                                      child: Text(
                                                        data.titleAr!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      data.weeklyMessage!,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  : const SizedBox();
                            }
                          } else if (state is WeeklyMessageFailure) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 100),
                              child: CustomErrorMassage(
                                  errorMassage: state.errorMassage),
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 100),
                              child: CustomLoadingWidget(),
                            );
                          }
                        },
                      )
                      /*      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: BorderDirectional(
                                      end: BorderSide(
                                        color: Colors.grey.shade400,
                                      ))),
                              child: Text(
                                S.of(context).sub_opinion,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                child: Text(
                                  S.of(context).opinions,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(
                        listOpinions.length,
                            (index) {
                          OpinionData data = listOpinions[index];
                          return Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: index.isOdd
                                  ? Colors.white
                                  : Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 48,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 5),
                                  decoration: BoxDecoration(
                                      border: BorderDirectional(
                                          end: BorderSide(
                                            color: Colors.grey.shade400,
                                          ))),
                                  child: Text(
                                    data.title!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                      data.studentPerformanceEvaluation!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                              ],
                            ),
                          );
                        },
                      )*/
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
