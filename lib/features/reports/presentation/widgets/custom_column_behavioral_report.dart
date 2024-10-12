import 'package:flutter/material.dart';

class CustomColumnBehavioralReport extends StatelessWidget {
  const CustomColumnBehavioralReport({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: Colors.grey.shade400, width: 0.5),
              end: BorderSide(color: Colors.grey.shade400, width: 0.5),
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
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: Colors.grey.shade400, width: 0.5),
              top: BorderSide(color: Colors.grey.shade400, width: 1),
              bottom: BorderSide(color: Colors.grey.shade400, width: 1),
              end: BorderSide(color: Colors.grey.shade400, width: 0.5),
            ),
          ),
          child: Flexible(
            child: Text(
              subTitle,
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
