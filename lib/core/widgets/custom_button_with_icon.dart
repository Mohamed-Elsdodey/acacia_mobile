import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatefulWidget {
  final String title;
  final void Function() onTap;
  final double? height;
  final TextStyle? titleStyle;
  final Widget icon;

  const CustomButtonWithIcon(
      {super.key,
      required this.title,
      required this.onTap,
      this.height,
      this.titleStyle,
      required this.icon});

  @override
  State<CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
}

class _CustomButtonWithIconState extends State<CustomButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: widget.titleStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 32.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
