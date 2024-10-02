import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/exams_model.dart';

class ExamsListItem extends StatefulWidget {
  const ExamsListItem({super.key, required this.examItem});

  final ExamItem examItem;

  @override
  State<ExamsListItem> createState() => _ExamsListItemState();
}

class _ExamsListItemState extends State<ExamsListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              AppAssets.exam,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
            child: Row(
              children: [
                Text(
                  S.of(context).subject,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 10),
                ),
                Expanded(
                  child: Text(
                    widget.examItem.category!.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
            child: Row(
              children: [
                Text(
                  S.of(context).total_degree,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 10),
                ),
                Expanded(
                  child: Text(
                    widget.examItem.degreeOfExam.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
            child: Row(
              children: [
                Text(
                  S.of(context).st_degree,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 10),
                ),
                Expanded(
                  child: Text(
                    widget.examItem.degreeOfStudent.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
            child: Row(
              children: [
                Text(
                  S.of(context).sub_teacher,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 10),
                ),
                Expanded(
                  child: Text(
                    widget.examItem.teacher!.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
