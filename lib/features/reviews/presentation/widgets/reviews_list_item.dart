import 'package:evaluation_and_follow_up/features/reviews/data/models/reviews_model.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ReviewsListItem extends StatefulWidget {
  const ReviewsListItem({super.key, required this.reviewItem});

  final ReviewItem reviewItem;

  @override
  State<ReviewsListItem> createState() => _ReviewsListItemState();
}

class _ReviewsListItemState extends State<ReviewsListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: widget.reviewItem.type == "negative"
            ? Colors.red.shade50
            : Colors.blue.shade50,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).st_info,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 14),
                  ),
                  Text(
                    widget.reviewItem.type == "negative"
                        ? S.of(context).nagative
                        : S.of(context).positive,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: widget.reviewItem.type == "negative"
                            ? Colors.red
                            : Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).points,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.points.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    widget.reviewItem.type == "negative"
                        ? S.of(context).total_nagative
                        : S.of(context).total_positive,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.balance.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).total_point,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.totalPoints.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).subject,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.category!.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).teacher,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.teacher!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).date,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                  Text(
                    widget.reviewItem.date!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
