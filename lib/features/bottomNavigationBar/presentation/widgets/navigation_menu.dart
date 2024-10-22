import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/navigation_model.dart';

typedef ValueChanged<T> = void Function(T value);

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late List<NavigationModel> listNavigation;
  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    listNavigation = [
      NavigationModel(
          id: 1, iconPath: AppAssets.icon1, title: S.of(context).home),
      NavigationModel(
          id: 2, iconPath: AppAssets.icon2, title: S.of(context).motivation),
      NavigationModel(
          id: 3, iconPath: AppAssets.icon3, title: S.of(context).childern),
      NavigationModel(
          id: 4, iconPath: AppAssets.icon4, title: S.of(context).classes),
      NavigationModel(
          id: 5, iconPath: AppAssets.icon5, title: S.of(context).more),
    ];
    return Container(
      height: 70.h,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: listNavigation.map((e) {
          return InkWell(
            onTap: () {
              setState(() {
                selectIndex = e.id;
                widget.onChanged(selectIndex);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(e.iconPath,
                    height: 24,
                    width: 24,
                    color: selectIndex == e.id
                        ? const Color(0xffFFD200)
                        : Colors.white),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    e.title,
                    style: TextStyle(
                        fontSize: 10,
                        color: selectIndex == e.id
                            ? const Color(0xffFFD200)
                            : Colors.white),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
