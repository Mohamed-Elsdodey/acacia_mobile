import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../data/models/academic_report_model.dart';
import '../manager/academicReport/academic_report_cubit.dart';
import 'custom_circle_pant.dart';

class TopCardHome extends StatefulWidget {
  const TopCardHome(
      {super.key, required this.academicReportMode, required this.studentId});

  final AcademicReportModel academicReportMode;
  final int studentId;
  // final void Function(String manth) onTap;

  @override
  State<TopCardHome> createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  String selectedManth = DateFormat.LLLL().format(DateTime.now().toLocal());
  String selectedManthNum = DateTime.now().month.toString();
  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الموجز',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // widget.onTap(selectedManthNum);
                        setState(() {
                          isSelected = 1;
                        });
                        BlocProvider.of<AcademicReportCubit>(context)
                            .getAcademicReport(
                                month: selectedManthNum,
                                studentId: widget.studentId.toString());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected == 1
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'الكل',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: isSelected == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isSelected = 2;
                        showMonthPicker(
                          // locale: const Locale('ar'),
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year, 1),
                          lastDate: DateTime(DateTime.now().year, 12),
                          monthPickerDialogSettings:
                              const MonthPickerDialogSettings(
                            buttonsSettings: PickerButtonsSettings(
                              monthTextStyle: TextStyle(fontSize: 12),
                              selectedDateRadius: 2,
                            ),
                          ),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              selectedManth =
                                  DateFormat.LLLL().format(date.toLocal());
                              selectedManthNum = date.month.toString();
                            });
                            // widget.onTap(selectedManthNum);
                            BlocProvider.of<AcademicReportCubit>(context)
                                .getAcademicReport(
                                    month: selectedManthNum,
                                    studentId: widget.studentId.toString());
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected == 2
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                selectedManth,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: isSelected == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16,
                                color: isSelected == 2
                                    ? Colors.white
                                    : Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(
                            100, 100), // no effect while adding child
                        painter: CustomCircularPaint(
                            progressValue: isSelected == 1
                                ? (widget.academicReportMode.data!
                                        .allAcademicPercentage! /
                                    100)
                                : (widget.academicReportMode.data!
                                        .monthAcademicPercentage! /
                                    100), //[0-1]
                            gradientColor: Colors.green),
                        child: Card(
                          margin: EdgeInsets.all(8),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          elevation: 4,
                          child: SizedBox(
                            height: 75,
                            width: 75,
                            child: Center(
                                child: Text(
                              isSelected == 1
                                  ? '%${(widget.academicReportMode.data!.allAcademicPercentage!)}'
                                  : '%${(widget.academicReportMode.data!.monthAcademicPercentage!)}',
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'أكاديمي',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        // size: const Size(100, 100), // no effect while adding child
                        painter: CustomCircularPaint(
                            progressValue: isSelected == 1
                                ? (widget.academicReportMode.data!
                                        .allBehavioralPercentage! /
                                    100)
                                : (widget.academicReportMode.data!
                                        .monthBehavioralPercentage! /
                                    100), //[0-1]
                            gradientColor: Colors.orangeAccent),
                        child: Card(
                          margin: EdgeInsets.all(8),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          elevation: 4,
                          child: SizedBox(
                            height: 75,
                            width: 75,
                            child: Center(
                                child: Text(
                              isSelected == 1
                                  ? '%${(widget.academicReportMode.data!.allBehavioralPercentage!)}'
                                  : '%${(widget.academicReportMode.data!.monthBehavioralPercentage!)}',
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'سلوكي',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
