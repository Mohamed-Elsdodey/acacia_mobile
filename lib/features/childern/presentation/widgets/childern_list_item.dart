import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/childern_model.dart';
import '../../../../generated/l10n.dart';
import '../../../notifications/presentation/views/notifications_view.dart';

class ChildernListItem extends StatelessWidget {
  const ChildernListItem({super.key, required this.childernInfo});

  final DataChildern childernInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 104.h,
                width: 80.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(childernInfo.image!)),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        childernInfo.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).row,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10),
                          ),
                          Expanded(
                            child: Text(
                              childernInfo.row!.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
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
                            S.of(context).room,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10),
                          ),
                          Expanded(
                            child: Text(
                              childernInfo.room!.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
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
                            S.of(context).rank_school,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10),
                          ),
                          Expanded(
                            child: Text(
                              childernInfo.schoolRank.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
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
                            S.of(context).rank_row,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10),
                          ),
                          Expanded(
                            child: Text(
                              childernInfo.rowRank.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
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
                            S.of(context).rank_room,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10),
                          ),
                          Expanded(
                            child: Text(
                              childernInfo.roomRank.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      GoTo.push(context,
                          NotificationsView(studentId: childernInfo.id!));
                    },
                    child: Image.asset(
                      AppAssets.notification,
                      color: Colors.black,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  PositionedDirectional(
                      top: 0,
                      start: 0,
                      child: CircleAvatar(
                        maxRadius: 8.r,
                        backgroundColor: Colors.red,
                        child: Center(
                          child: Text(
                            childernInfo.newNotificationCount.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
