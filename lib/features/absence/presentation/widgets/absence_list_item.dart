import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/absence_model.dart';

class AbsenceListItem extends StatefulWidget {
  const AbsenceListItem({super.key, required this.absenceItem});

  final AbsenceItem absenceItem;

  @override
  State<AbsenceListItem> createState() => _AbsenceListItemState();
}

class _AbsenceListItemState extends State<AbsenceListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.absenceItem.type == "delay"
          ? Colors.green.shade50
          : widget.absenceItem.type == "absence"
              ? Colors.red.shade50
              : Colors.yellow.shade50,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            width: 1,
            color: widget.absenceItem.type == "delay"
                ? const Color(0xff00CC99)
                : widget.absenceItem.type == "absence"
                    ? const Color(0xffEB5757)
                    : const Color(0xffFFD200)),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Container(
              height: 80,
              width: 10,
              margin: const EdgeInsetsDirectional.only(end: 5),
              decoration: BoxDecoration(
                color: widget.absenceItem.type == "delay"
                    ? const Color(0xff00CC99)
                    : widget.absenceItem.type == "absence"
                        ? const Color(0xffEB5757)
                        : const Color(0xffFFD200),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12),
                  bottomStart: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).student_type,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        Text(
                          widget.absenceItem.type == "delay"
                              ? S.of(context).delay
                              : S.of(context).absence,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: widget.absenceItem.type == "delay"
                                  ? const Color(0xff00CC99)
                                  : const Color(0xffEB5757)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.absenceItem.type == "delay"
                              ? S.of(context).day_delay
                              : S.of(context).day_absence,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 10),
                        ),
                        Text(
                          widget.absenceItem.type == "delay"
                              ? widget.absenceItem.delayDay.toString()
                              : widget.absenceItem.absenceDay.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: widget.absenceItem.type == "delay"
                                  ? const Color(0xff00CC99)
                                  : const Color(0xffEB5757)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.absenceItem.type == "delay"
                              ? S.of(context).total_delay
                              : S.of(context).total_absence,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 10),
                        ),
                        Text(
                          widget.absenceItem.type == "delay"
                              ? widget.absenceItem.delayMonth.toString()
                              : widget.absenceItem.absenceMonth.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
