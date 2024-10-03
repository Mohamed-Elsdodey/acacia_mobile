import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final void Function() onTap;
  final double? height;
  final TextStyle? titleStyle;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height,
      this.titleStyle});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
        child: Text(
          widget.title,
          style: widget.titleStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 32.0,
              ),
        ),
      ),
    );
  }
}
