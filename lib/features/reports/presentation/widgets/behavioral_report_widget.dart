import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/reports_model.dart';
import 'custom_column_behavioral_report.dart';

class BehavioralReportWidget extends StatelessWidget {
  const BehavioralReportWidget({super.key, required this.behavioralReport});
  final BehavioralReport behavioralReport;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Colors.deepPurple,
          ),
          alignment: Alignment.center,
          child: Text(
            S.of(context).reports_2,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: Row(
            children: List.generate(
              5,
              (index) => Expanded(
                child: CustomColumnBehavioralReport(
                  title: getTitle(index: index),
                  subTitle: getSubTitle(index: index, data: behavioralReport)
                      .toString(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getTitle({required int index}) {
    switch (index) {
      case 0:
        return "ايام الغياب";
      case 1:
        return "ايام التأخير";
      case 2:
        return "نقاط إجابية";
      case 3:
        return "نقاط سلبية";
      default:
        return "التقدير السلوكي";
    }
  }

  getSubTitle({required int index, required BehavioralReport data}) {
    switch (index) {
      case 0:
        return data.scrollBehavioralReport!.numberOfAbsenceDay;
      case 1:
        return data.scrollBehavioralReport!.numberOfDelayDay;
      case 2:
        return data.scrollBehavioralReport!.positivePoint;
      case 3:
        return data.scrollBehavioralReport!.negativePoint;
      default:
        return "${data.appreciationPercentage}%";
    }
  }
}
