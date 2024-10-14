import 'package:auto_size_text/auto_size_text.dart';
import 'package:evaluation_and_follow_up/features/reports/presentation/widgets/academic_report_widget.dart';
import 'package:evaluation_and_follow_up/features/reports/presentation/widgets/behavioral_report_widget.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/reports_model.dart';

class CustomReportsData extends StatefulWidget {
  const CustomReportsData({super.key, required this.reportsData});
  final ReportsData reportsData;

  @override
  State<CustomReportsData> createState() => _CustomReportsDataState();
}

class _CustomReportsDataState extends State<CustomReportsData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff333333),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            S.of(context).reports_title,
            minFontSize: 10,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        AcademicReportWidget(
          academicReport: widget.reportsData.academicReport!,
        ),
        BehavioralReportWidget(
            behavioralReport: widget.reportsData.behavioralReport!),
      ],
    );
  }
}
