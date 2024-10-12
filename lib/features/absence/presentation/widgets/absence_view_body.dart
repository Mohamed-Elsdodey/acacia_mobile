import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/absence/presentation/manager/absence/absence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/absence_model.dart';
import 'absence_list_item.dart';

class AbsenceViewBody extends StatefulWidget {
  const AbsenceViewBody({super.key});

  @override
  State<AbsenceViewBody> createState() => _AbsenceViewBodyState();
}

class _AbsenceViewBodyState extends State<AbsenceViewBody> {
  DateTime _currentDate = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        if (state is AbsenceSuccess) {
          if (state.absenceModel.status == 401) {
            return invalidToken(context);
          } else if (state.absenceModel.status == 403) {
            return Center(child: Text(S.of(context).no_absence));
          } else {
            List<AbsenceItem>? listAbsence = state.absenceModel.data;

            Map<DateTime, List<Event>> events = {};
            if (listAbsence!.isNotEmpty) {
              for (var i in listAbsence) {
                events.addAll({
                  DateTime(
                      DateTime.parse(i.date!).year,
                      DateTime.parse(i.date!).month,
                      DateTime.parse(i.date!).day): [
                    Event(
                      date: DateTime(
                          DateTime.parse(i.date!).year,
                          DateTime.parse(i.date!).month,
                          DateTime.parse(i.date!).day),
                      title: i.type!,
                    ),
                  ],
                });
              }
            }
            return CustomRefreshPage(
              onRefresh: () async {
                _currentDate = DateTime.now();
                _currentMonth = DateFormat.yMMM().format(DateTime.now());
                _targetDateTime = DateTime.now();
                await BlocProvider.of<AbsenceCubit>(context).getAbsence(
                    month: DateFormat('yyyy-MM', 'en').format(DateTime.now()));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      elevation: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 30),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month - 1);
                                        _currentMonth = DateFormat.yMMM()
                                            .format(_targetDateTime);
                                      });
                                      BlocProvider.of<AbsenceCubit>(context)
                                          .getAbsence(
                                              month: DateFormat('yyyy-MM', 'en')
                                                  .format(_targetDateTime));
                                    },
                                  ),
                                ),
                                Text(
                                  _currentMonth,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 30),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month + 1);
                                        _currentMonth = DateFormat.yMMM()
                                            .format(_targetDateTime);
                                      });
                                      BlocProvider.of<AbsenceCubit>(context)
                                          .getAbsence(
                                              month: DateFormat('yyyy-MM', 'en')
                                                  .format(_targetDateTime));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CalendarCarousel<Event>(
                              minSelectedDate: _currentDate
                                  .subtract(const Duration(days: 360)),
                              maxSelectedDate:
                                  _currentDate.add(const Duration(days: 360)),
                              onCalendarChanged: (DateTime date) {
                                setState(() {
                                  _targetDateTime = date;
                                  _currentMonth =
                                      DateFormat.yMMM().format(_targetDateTime);
                                });
                              },
                              targetDateTime: _targetDateTime,
                              prevDaysTextStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              inactiveDaysTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              isScrollable: false,
                              weekendTextStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              daysHaveCircularBorder: true,
                              thisMonthDayBorderColor: Colors.transparent,
                              showOnlyCurrentMonthDate: false,
                              weekdayTextStyle:
                                  const TextStyle(color: Colors.black),
                              weekFormat: false,
                              markedDatesMap: EventList<Event>(
                                events: events,
                              ),
                              height: 280.0,
                              weekDayMargin: EdgeInsets.zero,
                              dayPadding: 0,
                              todayTextStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              todayButtonColor: Colors.transparent,
                              todayBorderColor: Colors.transparent,
                              showHeader: false,
                              customGridViewPhysics:
                                  const NeverScrollableScrollPhysics(),
                              markedDateIconBuilder: (event) {
                                return Container(
                                  height: 60,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: event.title == "absence"
                                        ? const Color(0xffEB5757)
                                        : event.title == "delay"
                                            ? const Color(0xff00C191)
                                            : const Color(0xffFFD200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    DateFormat('d').format(event.date),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                );
                              },
                              showIconBehindDayText: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    listAbsence.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => AbsenceListItem(
                                absenceItem: listAbsence[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 8,
                              ),
                              itemCount: listAbsence.length,
                            ),
                          )
                        : Center(
                            child: Text(S.of(context).no_absence),
                          ),
                  ],
                ),
              ),
            );
          }
        } else if (state is AbsenceFailure) {
          return CustomErrorMassage(errorMassage: state.errorMassage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
