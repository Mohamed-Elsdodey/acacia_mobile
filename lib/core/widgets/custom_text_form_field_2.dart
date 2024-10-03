import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_strings.dart';

class CustomTextFormField2 extends StatefulWidget {
  const CustomTextFormField2({
    super.key,
    this.controller,
    this.validatorMassage,
    required this.hintText,
    this.onChanged,
    this.onSaved,
    this.isValidator = true,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String? validatorMassage;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? isValidator;
  final bool obscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
  String? lang;

  @override
  void didChangeDependencies() {
    lang = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: Colors.grey.shade300,
          filled: true,
          // hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          border: borderRadius(),
          // enabledBorder: buildBorder(color: AppColors.blueDark),
          focusedBorder: buildBorder(color: Colors.grey.shade300),
          prefixIcon: lang == AppStrings.enLangKey ? widget.prefixIcon : null,
          suffixIcon: lang == AppStrings.arLangKey ? widget.prefixIcon : null,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: color ?? Colors.grey,
        ));
  }

  OutlineInputBorder borderRadius() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none);
  }
}
