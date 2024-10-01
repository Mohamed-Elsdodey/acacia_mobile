import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../features/login/presentation/views/login_view.dart';
import '../../generated/l10n.dart';
import '../helper/AlertDialog/custom_alert_dialog.dart';
import '../widgets/custom_loading_widget.dart';
import 'go_to.dart';

Expanded invalidToken(BuildContext context) {
  Future.delayed(Duration.zero, () {
    if (context.mounted) {
      CustomAlertDialog.alertWithButton(
          context: context,
          type: AlertType.error,
          title: S.of(context).warning,
          desc: S.of(context).warning_massge,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          onPressed: () {
            GoTo.pushReplacement(context, const LoginView());
          });
    }
  });

  return const Expanded(child: CustomLoadingWidget());
}
