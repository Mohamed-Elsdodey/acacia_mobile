import 'package:flutter/material.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch(
      {super.key,
      this.controller,
      this.validatorMassage = 'Field is required',
      required this.hintText,
      this.onChanged,
      this.onSaved});
  final TextEditingController? controller;
  final String? validatorMassage;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return validatorMassage;
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.red,
          filled: true,
          // hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          border: borderRadius(),
          // enabledBorder: buildBorder(color: AppColors.blueDark),
          focusedBorder: buildBorder(color: Colors.red),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.red,
          ),
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