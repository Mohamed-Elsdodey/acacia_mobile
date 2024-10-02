import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../generated/l10n.dart';

class CustomAlertDialog {
  static alertWithButton({
    required BuildContext context,
    required AlertType type,
    required String title,
    required String desc,
    String? textButton,
    void Function()? onPressed,
    bool isOverlayTapDismiss = true,
    bool isCloseButton = true,
  }) {
    return Alert(
      context: context,
      type: type,
      title: title,
      desc: desc,
      style: AlertStyle(
          titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          descStyle: const TextStyle(
            fontSize: 18,
          ),
          isOverlayTapDismiss: isOverlayTapDismiss,
          isCloseButton: isCloseButton),
      buttons: [
        DialogButton(
          onPressed: onPressed ??
              () {
                Navigator.pop(context);
              },
          width: 120,
          color: Theme.of(context).primaryColor,
          child: Text(
            textButton ?? S.of(context).ok,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    ).show();
  }

  static alertWithTwoButton({
    required BuildContext context,
    required AlertType type,
    required String title,
    required String desc,
    required String textButton1,
    required String textButton2,
    required void Function() onPressedToButton1,
    required void Function() onPressedToButton2,
    bool isOverlayTapDismiss = true,
    bool isCloseButton = true,
  }) {
    return Alert(
      context: context,
      type: type,
      title: title,
      desc: desc,
      style: AlertStyle(
          titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          descStyle: const TextStyle(
            fontSize: 18,
          ),
          isOverlayTapDismiss: isOverlayTapDismiss,
          isCloseButton: isCloseButton),
      buttons: [
        DialogButton(
          onPressed: onPressedToButton1,
          width: 120,
          color: Colors.grey.withOpacity(.3),
          child: Text(
            textButton1,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        DialogButton(
          onPressed: onPressedToButton2,
          width: 120,
          color: Theme.of(context).primaryColor,
          child: Text(
            textButton2,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    ).show();
  }

  // static alertDelete({
  //   required BuildContext context,
  //   required Widget contentButton,
  // }) {
  //   return Alert(
  //     context: context,
  //     type: AlertType.warning,
  //     title: S.of(context).sure,
  //     desc: S.of(context).massage_delete,
  //     content: contentButton,
  //     style: AlertStyle(
  //         titleStyle: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.blueLight),
  //         descStyle: const TextStyle(
  //           fontSize: 18,
  //         ),
  //         isButtonVisible: false,
  //         buttonAreaPadding: const EdgeInsets.symmetric(vertical: 5),
  //         isOverlayTapDismiss: false,
  //         isCloseButton: true),
  //   ).show();
  // }
  //
  // static alertWithCustomContent({
  //   required BuildContext context,
  //   required String title,
  //   required Widget content,
  //   bool isOverlayTapDismiss = true,
  //   bool isCloseButton = true,
  // }) {
  //   return Alert(
  //     context: context,
  //     title: title,
  //     content: content,
  //     style: AlertStyle(
  //       titleStyle: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: AppColors.blueLight),
  //       isOverlayTapDismiss: isOverlayTapDismiss,
  //       isCloseButton: isCloseButton,
  //       isButtonVisible: false,
  //       alertPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
  //       buttonAreaPadding: const EdgeInsets.symmetric(vertical: 5),
  //       titlePadding: const EdgeInsets.symmetric(vertical: 5),
  //     ),
  //   ).show();
  // }
}
