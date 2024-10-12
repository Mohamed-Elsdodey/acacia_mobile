import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/notifications_model.dart';

class NotificationsListItem extends StatefulWidget {
  const NotificationsListItem({super.key, required this.notificationItem});

  final NotificationItem notificationItem;

  @override
  State<NotificationsListItem> createState() => _NotificationsListItemState();
}

class _NotificationsListItemState extends State<NotificationsListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Card(
        color: widget.notificationItem.type == "review"
            ? Colors.green.shade50
            : widget.notificationItem.type == "exam"
                ? Colors.yellow.shade50
                : Colors.red.shade50,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: BorderDirectional(
              top: BorderSide(
                  width: 1,
                  color: widget.notificationItem.type == "review"
                      ? const Color(0xff00CC99)
                      : widget.notificationItem.type == "exam"
                          ? const Color(0xffFFD200)
                          : const Color(0xffEB5757)),
              bottom: BorderSide(
                  width: 1,
                  color: widget.notificationItem.type == "review"
                      ? const Color(0xff00CC99)
                      : widget.notificationItem.type == "exam"
                          ? const Color(0xffFFD200)
                          : const Color(0xffEB5757)),
              end: BorderSide(
                  width: 1,
                  color: widget.notificationItem.type == "review"
                      ? const Color(0xff00CC99)
                      : widget.notificationItem.type == "exam"
                          ? const Color(0xffFFD200)
                          : const Color(0xffEB5757)),
              start: BorderSide(
                  width: 10,
                  color: widget.notificationItem.type == "review"
                      ? const Color(0xff00CC99)
                      : widget.notificationItem.type == "exam"
                          ? const Color(0xffFFD200)
                          : const Color(0xffEB5757)),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                widget.notificationItem.type == "review"
                    ? AppAssets.check
                    : widget.notificationItem.type == "exam"
                        ? AppAssets.warning
                        : AppAssets.close,
                height: 40,
                width: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.notificationItem.title.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.notificationItem.text.toString(),
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
