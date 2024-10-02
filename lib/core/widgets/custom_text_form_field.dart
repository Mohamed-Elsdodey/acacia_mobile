import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_strings.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validatorMassage,
    required this.hintText,
    this.onChanged,
    this.onSaved,
    this.isValidator = true,
    this.readOnly,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.isBorder,
    this.textStyle,
    this.filled,
    this.fillColor,
  });
  final TextEditingController? controller;
  final String? validatorMassage;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? isValidator;
  final bool obscureText;
  final bool? isBorder;
  final bool? readOnly;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final bool? filled;
  final Color? fillColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? lang;

  @override
  void didChangeDependencies() {
    lang = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 48,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.isValidator == true
              ? (value) {
                  if (value?.isEmpty ?? true) {
                    return widget.validatorMassage ??
                        S.of(context).field_is_required;
                  } else {
                    return null;
                  }
                }
              : null,
          // textAlign: TextAlign.center,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          style: widget.textStyle,
          readOnly: widget.readOnly ?? false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black87),
            filled: widget.filled,
            fillColor: widget.fillColor,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            border: buildBorder(isBorder: widget.isBorder),
            enabledBorder:
                buildBorder(color: Colors.red, isBorder: widget.isBorder),
            focusedBorder:
                buildBorder(color: Colors.red, isBorder: widget.isBorder),
            prefixIcon: lang == AppStrings.enLangKey ? widget.prefixIcon : null,
            suffixIcon: lang == AppStrings.arLangKey ? widget.prefixIcon : null,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({
    Color? color,
    required bool? isBorder,
  }) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(isBorder != false ? 12 : 0),
        borderSide: isBorder != false
            ? BorderSide(
                color: color ?? Colors.grey,
              )
            : BorderSide.none);
  }
}
