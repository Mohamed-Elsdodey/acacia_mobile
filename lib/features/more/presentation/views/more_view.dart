import 'package:flutter/material.dart';

import '../widgets/more_view_body.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoreViewBody(),
    );
  }
}
