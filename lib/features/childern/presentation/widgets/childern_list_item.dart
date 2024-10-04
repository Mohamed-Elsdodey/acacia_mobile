import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:evaluation_and_follow_up/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/childern_model.dart';
import '../../../../generated/l10n.dart';

class ChildernListItem extends StatelessWidget {
  const ChildernListItem({super.key, required this.childernInfo});

  final DataChildern childernInfo;

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 104,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(childernInfo.image!)),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      childernInfo.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          S.of(context).row,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        Text(
                          childernInfo.row!.title!,
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
                          S.of(context).room,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        Text(
                          childernInfo.room!.title!,
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
                          S.of(context).rank_school,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        Text(
                          childernInfo.schoolRank.toString(),
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
                          S.of(context).rank_row,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        Text(
                          childernInfo.rowRank.toString(),
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
                          S.of(context).rank_room,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        Text(
                          childernInfo.roomRank.toString(),
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
                    height: 30,
                    width: 30,
                  ),
                ),
                PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: CircleAvatar(
                      maxRadius: 7,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: Text(
                          childernInfo.newNotificationCount.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
