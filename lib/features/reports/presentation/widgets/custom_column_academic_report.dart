import 'package:flutter/material.dart';

class CustomColumnAcademicReport extends StatelessWidget {
  const CustomColumnAcademicReport(
      {super.key,
      required this.title,
      required this.subTitle1,
      required this.subTitle2,
      this.customBorder = false});
  final String title;
  final String subTitle1;
  final String subTitle2;
  final bool? customBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 80,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
              end: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
            ),
          ),
          child: Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 80,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
              top: BorderSide(color: Colors.grey.shade400, width: 1),
              bottom: BorderSide(color: Colors.grey.shade400, width: 1),
              end: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
            ),
          ),
          child: Flexible(
            child: Text(
              subTitle1,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 80,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
              end: BorderSide(
                  color: Colors.grey.shade400,
                  width: customBorder == true ? 0.5 : 1.0),
            ),
          ),
          child: Flexible(
            child: Text(
              subTitle2,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
