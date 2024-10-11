import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/manager/color_provider.dart';
import '../../../../core/utils/app_strings.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({super.key});

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  Color initcolor = const Color(0xff4EA74F);
  List<int> listColors = const [
    0xff4EA74F,
    0xff004BFE,
    0xff15244F,
    0xff4D3B6B,
    0xffB48200,
  ];

  @override
  void initState() {
    loadColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return SizedBox(
      height: 56.h,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 2,
        child: Row(
          children: List.generate(
            listColors.length,
            (index) => InkWell(
              onTap: () {
                colorProvider.changeColor(listColors[index]);
                setState(() {
                  initcolor = Color(listColors[index]);
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.r),
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: Color(listColors[index]), shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  Icons.done_rounded,
                  color: initcolor == Color(listColors[index])
                      ? Colors.white
                      : Colors.transparent,
                  size: 20.r,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  loadColor() async {
    final int? colorValue =
        await Pref.getIntFromPref(key: AppStrings.primaryColorKey);
    setState(() {
      initcolor = Color(colorValue ?? 0xff4EA74F);
    });
  }
}
