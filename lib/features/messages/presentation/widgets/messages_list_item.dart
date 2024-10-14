import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/messages_model.dart';


class MessagesListItem extends StatefulWidget {
  const MessagesListItem({super.key, required this.messageData});

  final MessageData messageData;

  @override
  State<MessagesListItem> createState() => _MessagesListItemState();
}

class _MessagesListItemState extends State<MessagesListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Card(
        color: getBackgroundColor(widget.messageData.type!),
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
                  width: 1, color: getColor(widget.messageData.type!)),
              bottom: BorderSide(
                  width: 1, color: getColor(widget.messageData.type!)),
              end: BorderSide(
                  width: 1, color: getColor(widget.messageData.type!)),
              start: BorderSide(
                  width: 10, color: getColor(widget.messageData.type!)),
            ),
          ),
          child: Row(
            children: [
              getIconPath(widget.messageData.type!) != null
                  ? Image.asset(
                      getIconPath(widget.messageData.type!)!,
                      height: 40,
                      width: 40,
                    )
                  : const SizedBox(
                      width: 10,
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.messageData.title.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.messageData.text.toString(),
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

  Color getColor(String type) {
    switch (type) {
      case "positive":
        return const Color(0xff00CC99);
      case "negative":
        return const Color(0xffEB5757);
      case "absence":
        return const Color(0xffEB5757);
      case "exam":
        return Colors.blue;
      case "message":
        return const Color(0xffFFD200);
      default:
        return Colors.purple;
    }
  }

  Color getBackgroundColor(String type) {
    switch (type) {
      case "positive":
        return Colors.green.shade50;
      case "negative":
        return Colors.red.shade50;
      case "absence":
        return Colors.red.shade50;
      case "exam":
        return Colors.blue.shade50;
      case "message":
        return Colors.yellow.shade50;
      default:
        return Colors.purple.shade50;
    }
  }

  String? getIconPath(String type) {
    switch (type) {
      case "positive":
        return AppAssets.check;
      case "negative":
        return AppAssets.close;
      case "absence":
        return AppAssets.close;
      case "exam":
        return null;
      case "message":
        return AppAssets.warning;
      default:
        return null;
    }
  }
}
