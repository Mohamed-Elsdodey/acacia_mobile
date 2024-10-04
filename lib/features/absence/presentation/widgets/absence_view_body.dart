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

class AbsenceViewBody extends StatefulWidget {
  const AbsenceViewBody({super.key});

  @override
  State<AbsenceViewBody> createState() => _AbsenceViewBodyState();
}

class _AbsenceViewBodyState extends State<AbsenceViewBody> {
  final DateTime _currentDate = DateTime.now();
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
            if (listAbsence!.isNotEmpty) {
              Map<DateTime, List<Event>> events = {};
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
              final calendarCarouselNoHeader = CalendarCarousel<Event>(
                minSelectedDate:
                    _currentDate.subtract(const Duration(days: 360)),
                maxSelectedDate: _currentDate.add(const Duration(days: 360)),
                onCalendarChanged: (DateTime date) {
                  setState(() {
                    _targetDateTime = date;
                    _currentMonth = DateFormat.yMMM().format(_targetDateTime);
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
                weekdayTextStyle: const TextStyle(color: Colors.black),
                weekFormat: false,
                markedDatesMap: EventList<Event>(
                  events: events,
                ),
                height: 250.0,
                weekDayMargin: EdgeInsets.zero,
                dayPadding: 0,
                todayTextStyle: const TextStyle(
                  color: Colors.black,
                ),
                todayButtonColor: Colors.transparent,
                todayBorderColor: Colors.transparent,
                showHeader: false,
                customGridViewPhysics: const NeverScrollableScrollPhysics(),
                markedDateIconBuilder: (event) {
                  return Container(
                    height: 60,
                    width: 30,
                    decoration: BoxDecoration(
                      color: event.title == "absence"
                          ? Colors.red
                          : Colors.green, // تخصيص لون خلفية اليوم المحدد
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      DateFormat('d').format(event.date), // عرض رقم اليوم
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  );
                },
                showIconBehindDayText: false,
              );
              return SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 30),
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
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: calendarCarouselNoHeader,
                      ), //
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text(S.of(context).no_absence));
            }
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
