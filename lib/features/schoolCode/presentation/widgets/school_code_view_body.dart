import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_buttom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/views/login_view.dart';
import '../manager/schoolCode/school_code_cubit.dart';

class SchoolCodeViewBody extends StatefulWidget {
  const SchoolCodeViewBody({super.key});

  @override
  State<SchoolCodeViewBody> createState() => _SchoolCodeViewBodyState();
}

class _SchoolCodeViewBodyState extends State<SchoolCodeViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          PositionedDirectional(
            end: 0,
            top: 0,
            child: Image.asset(
              AppAssets.bubble5,
              height: MediaQuery.of(context).size.height * .46,
              color: Theme.of(context).primaryColor,
            ),
          ),
          PositionedDirectional(
            start: 0,
            bottom: 0,
            child: Image.asset(
              AppAssets.bubble4,
              height: MediaQuery.of(context).size.height * .46,
              color: Theme.of(context).primaryColor.withOpacity(.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.loginLogo,
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        S.of(context).choose_school,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      S.of(context).p_choose_school,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: CustomTextFormField(
                      hintText: S.of(context).school_code,
                      fillColor: Colors.white60,
                      filled: true,
                      isBorder: false,
                      onSaved: (value) {
                        code = value!;
                      },
                    ),
                  ),
                  BlocConsumer<SchoolCodeCubit, SchoolCodeState>(
                    listener: (context, state) {
                      if (state is SchoolCodeSuccess) {
                        Pref.saveStringToPref(
                            key: AppStrings.schoolIdKey,
                            value: state.schoolCodeModel.data!.id!);
                        Pref.saveStringToPref(
                            key: AppStrings.schoolNameKey,
                            value: state.schoolCodeModel.data!.nameEn!);
                        Pref.saveStringToPref(
                            key: AppStrings.schoolDomainKey,
                            value: state.schoolCodeModel.data!.domain!);
                        GoTo.pushReplacement(context, const LoginView());
                      } else if (state is SchoolCodeFailure) {
                        CustomAlertDialog.alertWithButton(
                            context: context,
                            type: AlertType.error,
                            title: S.of(context).error,
                            desc: state.errorMassage);
                      }
                    },
                    builder: (context, state) {
                      if (state is SchoolCodeLoading) {
                        return const CustomLoadingWidget();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 60, top: 10),
                          child: CustomButton(
                            onTap: () {
                              if (formState.currentState!.validate()) {
                                formState.currentState!.save();
                                BlocProvider.of<SchoolCodeCubit>(context)
                                    .getSchoolByCode(code: code);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                            title: S.of(context).next,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
