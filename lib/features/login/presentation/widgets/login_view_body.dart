import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_loading_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../../bottomNavigationBar/presentation/views/bottom_navigatiaon_bar_view.dart';
import '../../../schoolCode/presentation/views/school_code_view.dart';
import '../manager/login/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String email = '', password = '', schoolName = '';
  bool obscureText = true;
  String? tokenFirebase;
  @override
  void initState() {
    getData();
    getTokenFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              end: 0,
              top: 0,
              child: Image.asset(
                AppAssets.bubble2,
                height: MediaQuery.of(context).size.height * .47,
                color: Theme.of(context).primaryColor.withOpacity(.15),
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              end: 0,
              top: 0,
              child: Image.asset(
                AppAssets.bubble1,
                height: MediaQuery.of(context).size.height * .38,
                color: Theme.of(context).primaryColor,
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              start: 0,
              bottom: 0,
              child: Image.asset(
                AppAssets.bubble4,
                height: MediaQuery.of(context).size.height * .46,
                color: Theme.of(context).primaryColor.withOpacity(.15),
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: MediaQuery.of(context).size.height * .35,
              child: Image.asset(
                AppAssets.bubble3,
                height: MediaQuery.of(context).size.height * .23,
                color: Theme.of(context).primaryColor.withOpacity(.15),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          S.of(context).login,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "${S.of(context).welcome}$schoolName ! ❤",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 8),
                      child: CustomTextFormField(
                        hintText: S.of(context).email,
                        fillColor: Colors.white60,
                        keyboardType: TextInputType.emailAddress,
                        filled: true,
                        isBorder: false,
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 50),
                      child: CustomTextFormField(
                        hintText: S.of(context).password,
                        fillColor: Colors.white60,
                        keyboardType: TextInputType.text,
                        obscureText: obscureText,
                        prefixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        filled: true,
                        isBorder: false,
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          if (state.loginModel.status == 403) {
                            CustomAlertDialog.alertWithButton(
                                context: context,
                                type: AlertType.error,
                                title: S.of(context).error,
                                desc: S.of(context).no_email);
                          } else if (state.loginModel.status == 422) {
                            CustomAlertDialog.alertWithButton(
                                context: context,
                                type: AlertType.error,
                                title: S.of(context).error,
                                desc: S.of(context).no_password);
                          } else {
                            Pref.saveIntToPref(
                                key: AppStrings.parantIdKey,
                                value: state.loginModel.data!.id!);
                            Pref.saveStringToPref(
                                key: AppStrings.parantNameKey,
                                value: state.loginModel.data!.name!);
                            Pref.saveStringToPref(
                                key: AppStrings.parantEmailKey,
                                value: state.loginModel.data!.email!);
                            Pref.saveStringToPref(
                                key: AppStrings.parantPhoneKey,
                                value: state.loginModel.data!.phone!);
                            Pref.saveStringToPref(
                                key: AppStrings.parantTokenKey,
                                value: state.loginModel.data!.token!);
                            Pref.saveBoolToPref(
                                key: AppStrings.isLoginKey, value: true);
                            upDateTokenNotifications(
                              tokenLogin: state.loginModel.data!.token!,
                              tokenFirebase: tokenFirebase ?? "",
                            );
                            GoTo.pushAndRemoveUntil(
                                context, const BottomNavigationBarView());
                          }
                        } else if (state is LoginFailure) {
                          CustomAlertDialog.alertWithButton(
                              context: context,
                              type: AlertType.error,
                              title: S.of(context).error,
                              desc: state.errorMassage);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const CustomLoadingWidget();
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 10),
                            child: CustomButton(
                              onTap: () {
                                if (formState.currentState!.validate()) {
                                  formState.currentState!.save();
                                  if (RegExp(AppStrings.emailException)
                                      .hasMatch(email)) {
                                    BlocProvider.of<LoginCubit>(context).login(
                                        email: email, password: password);
                                  } else {
                                    CustomAlertDialog.alertWithButton(
                                        context: context,
                                        type: AlertType.error,
                                        title: S.of(context).error,
                                        desc: S.of(context).invalid_email);
                                  }
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
                    TextButton(
                        onPressed: () async {
                          GoTo.pushAndRemoveUntil(
                              context, const SchoolCodeView());
                        },
                        child: Text(
                          S.of(context).choose_anther_school,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData() async {
    String name =
        await Pref.getStringFromPref(key: AppStrings.schoolNameKey) ?? "";
    setState(() {
      schoolName = name;
    });
  }

  void getTokenFirebase() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String? token = await messaging.getToken();
    Pref.saveStringToPref(key: AppStrings.firebaseTokenKey, value: token ?? "");
    setState(() {
      tokenFirebase = token;
    });
  }
}
