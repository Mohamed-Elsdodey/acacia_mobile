import 'package:flutter/material.dart';

class CustomRefreshPage extends StatelessWidget {
  const CustomRefreshPage(
      {super.key, required this.child, required this.onRefresh});
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
