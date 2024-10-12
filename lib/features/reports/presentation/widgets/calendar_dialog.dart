import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key, required this.onSelect});
  final void Function(String month, String monthFormat) onSelect;

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  int selectedYear = DateTime.now().year;
  String selectedMonth = DateFormat.MMM().format(DateTime.now());

  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "$selectedMonth $selectedYear",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2A2F3B)),
                ),
              ),
            ),
            // السنة المحددة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedYear--;
                    });
                  },
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: Text(
                      '$selectedYear',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedYear++;
                    });
                  },
                ),
              ],
            ),
            // شبكة الأشهر
            SizedBox(
              height: 190,
              width: 250,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 4 / 2,
                children: List.generate(
                  months.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedMonth = months[index];
                        });
                      },
                      child: Container(
                        height: 35.h,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: selectedMonth == months[index]
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(.1),
                        ),
                        child: Text(
                          months[index],
                          style: TextStyle(
                              fontSize: 14,
                              color: selectedMonth == months[index]
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                onTap: () {
                  String monthFinal;
                  int month = months.indexOf(selectedMonth) + 1;
                  if (month >= 1 && month <= 9) {
                    monthFinal = "$selectedYear-0$month";
                  } else {
                    monthFinal = "$selectedYear-$month";
                  }

                  widget.onSelect(monthFinal, "$selectedMonth $selectedYear");
                  GoTo.pop(context);
                },
                child: Container(
                  height: 35,
                  width: 80,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    S.of(context).save,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
