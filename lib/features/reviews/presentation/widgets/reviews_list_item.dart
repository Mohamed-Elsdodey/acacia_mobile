import 'package:evaluation_and_follow_up/features/reviews/data/models/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(bottom: 8.r),
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
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).st_info,
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 14.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.type == "negative"
                          ? S.of(context).nagative
                          : S.of(context).positive,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: widget.reviewItem.type == "negative"
                              ? Colors.red
                              : Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).points,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.points.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reviewItem.type == "negative"
                        ? S.of(context).total_nagative
                        : S.of(context).total_positive,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.balance.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).total_point,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.totalPoints.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).subject,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.category!.title!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).teacher,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.teacher!.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).date,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  ),
                  Expanded(
                    child: Text(
                      widget.reviewItem.date!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
