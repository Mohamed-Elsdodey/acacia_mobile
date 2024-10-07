import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_refresh_page.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/reports_model.dart';
import '../manager/reports/reports_cubit.dart';
import 'calendar_dialog.dart';
import 'custom_reports_data.dart';

class ReportsViewBody extends StatefulWidget {
  const ReportsViewBody({super.key});

  @override
  State<ReportsViewBody> createState() => _ReportsViewBodyState();
}

class _ReportsViewBodyState extends State<ReportsViewBody> {
  String schoolName = "";
  String monthToApi = DateFormat('yyyy-MM', 'en').format(DateTime.now());
  String monthText = DateFormat.yMMM().format(DateTime.now());
  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<ReportsCubit>(context).getReports(
            month: DateFormat('yyyy-MM', 'en').format(DateTime.now()));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) {
            if (state is ReportsSuccess) {
              if (state.reportsModel.status == 401) {
                return invalidToken(context);
              } else if (state.reportsModel.status == 403) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Center(child: Text(state.reportsModel.message![0])),
                );
              } else {
                ReportsData? reportsData = state.reportsModel.data;

                if (reportsData != null) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
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
                            "${S.of(context).school}$schoolName",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CalendarDialog(
                                    onSelect: (month, monthFormat) {
                                      setState(() {
                                        monthText = monthFormat;
                                        monthToApi = month;
                                      });
                                    },
                                  );
                                },
                              ).then(
                                (value) {
                                  BlocProvider.of<ReportsCubit>(context)
                                      .getReports(month: monthToApi);
                                },
                              );
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Color(0xffEDEDED), width: 2)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      monthText,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2F3B)),
                                    ),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xff2A2F3B))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomReportsData(
                          reportsData: reportsData,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Center(child: Text(state.reportsModel.message![0])),
                  );
                }
              }
            } else if (state is ReportsFailure) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: CustomErrorMassage(errorMassage: state.errorMassage),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: const CustomLoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }

  void getData() async {
    String? name =
        await Pref.getStringFromPref(key: AppStrings.schoolNameKey) ?? "";
    setState(() {
      schoolName = name;
    });
  }
}
