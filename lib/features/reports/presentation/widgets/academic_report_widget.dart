import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/reports_model.dart';
import 'custom_column_academic_report.dart';

class AcademicReportWidget extends StatelessWidget {
  const AcademicReportWidget({super.key, required this.academicReport});
  final AcademicReport academicReport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Color(0xff00C191),
            ),
            alignment: Alignment.center,
            child: Flexible(
              child: Text(
                S.of(context).reports_1,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1),
            ),
            child: Row(
              children: [
                CustomColumnAcademicReport(
                    title: S.of(context).sub,
                    subTitle1: S.of(context).total_degrees,
                    subTitle2: S.of(context).degree_stu),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        academicReport.exams!.length,
                        (index) {
                          Exams examData = academicReport.exams![index];
                          return CustomColumnAcademicReport(
                              customBorder: true,
                              title: examData.category!.title!,
                              subTitle1: examData.degreeOfExam.toString(),
                              subTitle2: examData.degreeOfStudent.toString());
                        },
                      ),
                    ),
                  ),
                ),
                CustomColumnAcademicReport(
                    title: S.of(context).academic_degree,
                    subTitle1: "${academicReport.appreciationPercentage}%",
                    subTitle2: academicReport.appreciationTitle!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
