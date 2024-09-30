import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/models/childern_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/childern_info.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/academic_report_model.dart';
import '../../data/models/subject_report_model.dart';
import '../manager/academicReport/academic_report_cubit.dart';
import '../manager/childern/childern_cubit.dart';
import '../manager/subjectReport/subject_report_cubit.dart';
import 'colors_widget.dart';
import 'custom_circle_pant.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late int childernId;
  late DataChildern childernData;
  String selectedManth1 = DateFormat.LLLL().format(DateTime.now().toLocal());
  String selectedManthNum1 = DateTime.now().month.toString();
  int isSelected1 = 1;
  String selectedManth2 = DateFormat.LLLL().format(DateTime.now().toLocal());
  String selectedManthNum2 = DateTime.now().month.toString();
  int isSelected2 = 1;

  bool isLoaging = true;

  @override
  void initState() {
    getChildernData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ColorsWidget(),
            BlocBuilder<ChildernCubit, ChildernState>(
              builder: (context, state) {
                if (state is ChildernSuccess) {
                  List<DataChildern>? listChildern = state.childernModel.data;
                  if (listChildern != null) {
                    if (childernId == -1) {
                      childernId = listChildern[0].id!;
                      childernData = listChildern[0];
                      BlocProvider.of<AcademicReportCubit>(context)
                          .getAcademicReport(
                              month: DateTime.now().month.toString(),
                              studentId: childernData.id!.toString());
                      BlocProvider.of<SubjectReportCubit>(context)
                          .getSubjectReport(
                              month: DateTime.now().month.toString(),
                              studentId: childernData.id!.toString());
                    } else {
                      childernData = listChildern.firstWhere(
                        (element) => element.id == childernId,
                      );
                      BlocProvider.of<AcademicReportCubit>(context)
                          .getAcademicReport(
                              month: DateTime.now().month.toString(),
                              studentId: childernData.id!.toString());
                      BlocProvider.of<SubjectReportCubit>(context)
                          .getSubjectReport(
                              month: DateTime.now().month.toString(),
                              studentId: childernData.id!.toString());
                    }
                    return Column(
                      children: [
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
                            initialItem: childernData.name,
                            closedHeaderPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: const CustomDropdownDecoration(
                              headerStyle:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              closedFillColor: Colors.transparent,
                            ),
                            items: List.generate(
                              listChildern.length,
                              (index) => listChildern[index].name!,
                            ),
                            onChanged: (value) {
                              childernData = listChildern.firstWhere(
                                (element) => element.name == value,
                              );
                              BlocProvider.of<AcademicReportCubit>(context)
                                  .getAcademicReport(
                                      month: DateTime.now().month.toString(),
                                      studentId: childernData.id!.toString());
                              BlocProvider.of<SubjectReportCubit>(context)
                                  .getSubjectReport(
                                      month: DateTime.now().month.toString(),
                                      studentId: childernData.id!.toString());

                              Pref.saveIntToPref(
                                  key: AppStrings.childernIdKey,
                                  value: childernData.id!);
                              setState(() {
                                childernId = childernData.id!;
                                selectedManth1 = DateFormat.LLLL()
                                    .format(DateTime.now().toLocal());
                                selectedManthNum1 =
                                    DateTime.now().month.toString();
                                isSelected1 = 1;
                                selectedManth2 = DateFormat.LLLL()
                                    .format(DateTime.now().toLocal());
                                selectedManthNum2 =
                                    DateTime.now().month.toString();
                                isSelected2 = 1;
                              });
                            },
                          ),
                        ),
                        ChildernInfo(
                          childernInfo: childernData,
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                        child: Center(child: Text(S.of(context).no_childern)));
                  }
                } else if (state is ChildernFailure) {
                  return CustomErrorMassage(errorMassage: state.errorMassage);
                } else {
                  return SizedBox(
                    height: 200,
                    child: Card(
                      color: Colors.grey[100],
                      surfaceTintColor: Colors.grey[100],
                      shadowColor: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: const CustomLoadingWidget(),
                    ),
                  );
                }
              },
            ),
            StatefulBuilder(
              builder: (context, aSetState) =>
                  BlocBuilder<AcademicReportCubit, AcademicReportState>(
                builder: (context, state) {
                  if (state is AcademicReportSuccess) {
                    AcademicReportModel academicReportMode =
                        state.academicReportModel;
                    return SizedBox(
                      height: 250,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          aSetState(() {
                                            isSelected1 = 1;
                                          });
                                          BlocProvider.of<AcademicReportCubit>(
                                                  context)
                                              .getAcademicReport(
                                                  month: selectedManthNum1,
                                                  studentId: childernData.id!
                                                      .toString());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 12),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: isSelected1 == 1
                                                ? Theme.of(context).primaryColor
                                                : Colors.transparent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'الكل',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: isSelected1 == 1
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          isSelected1 = 2;
                                          showMonthPicker(
                                            // locale: const Locale('ar'),
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(
                                                DateTime.now().year, 1),
                                            lastDate: DateTime(
                                                DateTime.now().year, 12),
                                            monthPickerDialogSettings:
                                                const MonthPickerDialogSettings(
                                              buttonsSettings:
                                                  PickerButtonsSettings(
                                                monthTextStyle:
                                                    TextStyle(fontSize: 12),
                                                selectedDateRadius: 2,
                                              ),
                                            ),
                                          ).then((date) {
                                            if (date != null) {
                                              aSetState(() {
                                                selectedManth1 =
                                                    DateFormat.LLLL()
                                                        .format(date.toLocal());
                                                selectedManthNum1 =
                                                    date.month.toString();
                                              });
                                              // widget.onTap(selectedManthNum);
                                              if (context.mounted) {
                                                BlocProvider.of<
                                                            AcademicReportCubit>(
                                                        context)
                                                    .getAcademicReport(
                                                        month:
                                                            selectedManthNum1,
                                                        studentId: childernData
                                                            .id!
                                                            .toString());
                                              }
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 12),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: isSelected1 == 2
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                          ),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  selectedManth1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: isSelected1 == 2
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 16,
                                                  color: isSelected1 == 2
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomPaint(
                                          size: const Size(100,
                                              100), // no effect while adding child
                                          painter: CustomCircularPaint(
                                              progressValue: isSelected1 == 1
                                                  ? (academicReportMode.data!
                                                          .allAcademicPercentage! /
                                                      100)
                                                  : (academicReportMode.data!
                                                          .monthAcademicPercentage! /
                                                      100), //[0-1]
                                              gradientColor: Colors.green),
                                          child: Card(
                                            margin: const EdgeInsets.all(8),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey.shade300),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            elevation: 4,
                                            child: SizedBox(
                                              height: 75,
                                              width: 75,
                                              child: Center(
                                                  child: Text(
                                                isSelected1 == 1
                                                    ? '%${(academicReportMode.data!.allAcademicPercentage!)}'
                                                    : '%${(academicReportMode.data!.monthAcademicPercentage!)}',
                                              )),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'أكاديمي',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomPaint(
                                          // size: const Size(100, 100), // no effect while adding child
                                          painter: CustomCircularPaint(
                                              progressValue: isSelected1 == 1
                                                  ? (academicReportMode.data!
                                                          .allBehavioralPercentage! /
                                                      100)
                                                  : (academicReportMode.data!
                                                          .monthBehavioralPercentage! /
                                                      100), //[0-1]
                                              gradientColor:
                                                  Colors.orangeAccent),
                                          child: Card(
                                            margin: const EdgeInsets.all(8),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey.shade300),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            elevation: 4,
                                            child: SizedBox(
                                              height: 75,
                                              width: 75,
                                              child: Center(
                                                  child: Text(
                                                isSelected1 == 1
                                                    ? '%${(academicReportMode.data!.allBehavioralPercentage!)}'
                                                    : '%${(academicReportMode.data!.monthBehavioralPercentage!)}',
                                              )),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'سلوكي',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (state is AcademicReportFailure) {
                    return CustomErrorMassage(errorMassage: state.errorMassage);
                  } else {
                    return SizedBox(
                      height: 250,
                      child: Card(
                        color: Colors.grey[100],
                        surfaceTintColor: Colors.grey[100],
                        shadowColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: const CustomLoadingWidget(),
                      ),
                    );
                  }
                },
              ),
            ),
            StatefulBuilder(
              builder: (context, bSetState) =>
                  BlocBuilder<SubjectReportCubit, SubjectReportState>(
                builder: (context, state) {
                  if (state is SubjectReportSuccess) {
                    SubjectReportModel subjectReportModel =
                        state.subjectReportModel;
                    List<DataSubject>? listData = subjectReportModel.data!;
                    List<LineChartBarData> lineBarsData = [
                      LineChartBarData(
                        spots: List.generate(
                          listData.length,
                          (index) {
                            return FlSpot(
                                index.toDouble(),
                                isSelected2 == 1
                                    ? listData[index].allPerentage!.toDouble()
                                    : listData[index]
                                        .monthPercentage!
                                        .toDouble());
                          },
                        ),
                        isCurved: true,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(
                          cutOffY: -14,
                          applyCutOffY: true,
                          show: false,
                        ),
                        color: Colors.green,
                        showingIndicators: List.generate(
                          listData.length,
                          (index) => index,
                        ),
                        barWidth: 2,
                      ),
                    ];
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
                                        bSetState(() {
                                          isSelected2 = 1;
                                        });
                                        BlocProvider.of<AcademicReportCubit>(
                                                context)
                                            .getAcademicReport(
                                                month: selectedManthNum2,
                                                studentId: childernData.id!
                                                    .toString());
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 12),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: isSelected2 == 1
                                              ? Theme.of(context).primaryColor
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'الكل',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: isSelected2 == 1
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        isSelected2 = 2;
                                        showMonthPicker(
                                          // locale: const Locale('ar'),
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate:
                                              DateTime(DateTime.now().year, 1),
                                          lastDate:
                                              DateTime(DateTime.now().year, 12),
                                          monthPickerDialogSettings:
                                              const MonthPickerDialogSettings(
                                            buttonsSettings:
                                                PickerButtonsSettings(
                                              monthTextStyle:
                                                  TextStyle(fontSize: 12),
                                              selectedDateRadius: 2,
                                            ),
                                          ),
                                        ).then((date) {
                                          if (date != null) {
                                            bSetState(() {
                                              selectedManth2 = DateFormat.LLLL()
                                                  .format(date.toLocal());
                                              selectedManthNum2 =
                                                  date.month.toString();
                                            });
                                            // widget.onTap(selectedManthNum);
                                            if (context.mounted) {
                                              BlocProvider.of<
                                                          AcademicReportCubit>(
                                                      context)
                                                  .getAcademicReport(
                                                      month: selectedManthNum2,
                                                      studentId: childernData
                                                          .id!
                                                          .toString());
                                            }
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 12),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: isSelected2 == 2
                                              ? Theme.of(context).primaryColor
                                              : Colors.white,
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                selectedManth2,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: isSelected2 == 2
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 16,
                                                color: isSelected2 == 2
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
                            SizedBox(
                              height: 200,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: LineChart(
                                  LineChartData(
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: lineBarsData,
                                    titlesData: FlTitlesData(
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          // interval: 0.5,
                                          reservedSize: 100,

                                          getTitlesWidget: (value, meta) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                      listData[value.toInt()]
                                                          .title!)),
                                            );
                                          },
                                        ),
                                      ),
                                      leftTitles: const AxisTitles(
                                        axisNameWidget: Text(''),
                                        axisNameSize: 20,
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                          reservedSize: 0,
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        axisNameWidget: Text(''),
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                          reservedSize: 0,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        axisNameWidget: Text(''),
                                        axisNameSize: 24,
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 0,
                                        ),
                                      ),
                                    ),
                                    gridData: const FlGridData(show: true),
                                    extraLinesData: const ExtraLinesData(),
                                    minY: 0,
                                    lineTouchData: custombuildLineTouchData(),
                                    showingTooltipIndicators: List.generate(
                                      listData.length,
                                      (index) => index,
                                    ).map((index) {
                                      return ShowingTooltipIndicators([
                                        LineBarSpot(
                                          lineBarsData[0],
                                          lineBarsData.indexOf(lineBarsData[0]),
                                          lineBarsData[0].spots[index],
                                        ),
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (state is SubjectReportFailure) {
                    return CustomErrorMassage(errorMassage: state.errorMassage);
                  } else {
                    return SizedBox(
                      height: 250,
                      child: Card(
                        color: Colors.grey[100],
                        surfaceTintColor: Colors.grey[100],
                        shadowColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: const CustomLoadingWidget(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineTouchData custombuildLineTouchData() {
    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
        if (response == null || response.lineBarSpots == null) {
          return;
        }
      },
      mouseCursorResolver: (FlTouchEvent event, LineTouchResponse? response) {
        if (response == null || response.lineBarSpots == null) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      },
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            const FlLine(
              strokeWidth: 1.5,
              color: Color(0xFFB48200),
            ),
            FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 4,
                color: Colors.white,
                strokeWidth: 1.5,
                strokeColor: const Color(0xFFB48200),
              ),
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.white,
        tooltipPadding: EdgeInsets.zero,
        getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
          return lineBarsSpot.map((lineBarSpot) {
            int numberAsInt = lineBarSpot.y.truncate();
            return LineTooltipItem("$numberAsInt%",
                const TextStyle(fontSize: 12, color: Colors.black));
          }).toList();
        },
      ),
    );
  }

  void getChildernData() async {
    int? id = await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
    setState(() {
      childernId = id;
    });
  }
}
