import 'package:evaluation_and_follow_up/core/widgets/custom_text_form_field_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/go_to.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/views/login_view.dart';
import '../manager/dataAccount/data_account_cubit.dart';

class DataAccountViewBody extends StatefulWidget {
  const DataAccountViewBody({super.key});

  @override
  State<DataAccountViewBody> createState() => _DataAccountViewBodyState();
}

class _DataAccountViewBodyState extends State<DataAccountViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String newPassword = "", confirmPassword = "";
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  @override
  void initState() {
    getDatt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFormField2(
                  hintText: S.of(context).name,
                  controller: nameController,
                  isValidator: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField2(
                  hintText: S.of(context).email,
                  controller: emailController,
                  isValidator: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField2(
                  hintText: S.of(context).new_password,
                  isValidator: false,
                  obscureText: obscureTextPassword,
                  keyboardType: TextInputType.text,
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextPassword = !obscureTextPassword;
                      });
                    },
                    icon: Icon(obscureTextPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  onSaved: (value) {
                    newPassword = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField2(
                  hintText: S.of(context).confirm_password,
                  isValidator: false,
                  obscureText: obscureTextConfirmPassword,
                  keyboardType: TextInputType.text,
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextConfirmPassword =
                            !obscureTextConfirmPassword;
                      });
                    },
                    icon: Icon(obscureTextConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  onSaved: (value) {
                    confirmPassword = value!;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocConsumer<DataAccountCubit, DataAccountState>(
                  listener: (context, state) {
                    if (state is DataAccountSuccess) {
                      if (state.dataAccountModel.status == 401) {
                        CustomAlertDialog.alertWithButton(
                            context: context,
                            type: AlertType.error,
                            title: S.of(context).warning,
                            desc: S.of(context).warning_massge,
                            isCloseButton: false,
                            isOverlayTapDismiss: false,
                            onPressed: () {
                              GoTo.pushAndRemoveUntil(
                                  context, const LoginView());
                            });
                      } else {
                        Pref.saveIntToPref(
                            key: AppStrings.parantIdKey,
                            value: state.dataAccountModel.data!.id!);
                        Pref.saveStringToPref(
                            key: AppStrings.parantNameKey,
                            value: state.dataAccountModel.data!.name!);
                        Pref.saveStringToPref(
                            key: AppStrings.parantEmailKey,
                            value: state.dataAccountModel.data!.email!);
                        Pref.saveStringToPref(
                            key: AppStrings.parantPhoneKey,
                            value: state.dataAccountModel.data!.phone!);
                        CustomAlertDialog.alertWithButton(
                            context: context,
                            type: AlertType.success,
                            title: S.of(context).ok,
                            desc: S.of(context).updated_successfully,
                            isCloseButton: false,
                            isOverlayTapDismiss: false,
                            onPressed: () {
                              GoTo.pop(context);
                              GoTo.pop(context);
                            });
                      }
                    } else if (state is DataAccountFailure) {
                      CustomAlertDialog.alertWithButton(
                          context: context,
                          type: AlertType.error,
                          title: S.of(context).error,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          desc: state.errorMassage);
                    }
                  },
                  builder: (context, state) {
                    if (state is DataAccountLoading) {
                      return const CustomLoadingWidget();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: CustomButton(
                          height: 50,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          onTap: () {
                            if (formState.currentState!.validate()) {
                              formState.currentState!.save();
                              if (RegExp(AppStrings.emailException)
                                  .hasMatch(emailController.text)) {
                                if (newPassword != confirmPassword) {
                                  CustomAlertDialog.alertWithButton(
                                      context: context,
                                      type: AlertType.error,
                                      title: S.of(context).error,
                                      isCloseButton: false,
                                      isOverlayTapDismiss: false,
                                      desc: S.of(context).invalid_password);
                                } else {
                                  BlocProvider.of<DataAccountCubit>(context)
                                      .upDateDataAccount(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: confirmPassword,
                                  );
                                }
                              } else {
                                CustomAlertDialog.alertWithButton(
                                    context: context,
                                    type: AlertType.error,
                                    title: S.of(context).error,
                                    isCloseButton: false,
                                    isOverlayTapDismiss: false,
                                    desc: S.of(context).invalid_email);
                              }
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          title: S.of(context).save_changes,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getDatt() async {
    String name =
        await Pref.getStringFromPref(key: AppStrings.parantNameKey) ?? "";
    String email =
        await Pref.getStringFromPref(key: AppStrings.parantEmailKey) ?? "";
    setState(() {
      nameController.text = name;
      emailController.text = email;
    });
  }
}
