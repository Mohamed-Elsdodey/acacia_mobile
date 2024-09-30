import 'package:flutter/material.dart';

import '../widgets/navigation_helper.dart';
import '../widgets/navigation_menu.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationMenu(
        onChanged: (int value) {
          setState(() {
            selectIndex = value;
          });
        },
      ),
      body: NavigationHelper.getMyWidget(selectIndex),
    );
  }
}
