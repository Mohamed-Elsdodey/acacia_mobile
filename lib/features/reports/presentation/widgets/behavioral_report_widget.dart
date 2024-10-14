import 'package:auto_size_text/auto_size_text.dart';
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Color(0xff9747FF),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            S.of(context).reports_2,
            maxLines: 1,
            minFontSize: 10,
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
                  title: getTitle(index: index, context: context),
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

  getTitle({required int index, required BuildContext context}) {
    switch (index) {
      case 0:
        return S.of(context).number_of_absence_day;
      case 1:
        return S.of(context).number_of_delay_day;
      case 2:
        return S.of(context).positive_point;
      case 3:
        return S.of(context).negative_point;
      default:
        return S.of(context).appreciation_percentage;
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
