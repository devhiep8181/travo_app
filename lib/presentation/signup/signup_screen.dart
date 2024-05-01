// Dart imports:

// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../core/utils/utils_export.dart';
import '../../l10n/l10n.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/export_widgets.dart';
import '../auth/authen/auth_bloc.dart';
import '../auth/user/user_bloc.dart';
import '../login/blocs/bloc/account_bloc.dart';
import '../login/widgets/export_widgets_login.dart';
import 'blocs/country/country_bloc.dart';
import 'blocs/create_user/create_user_bloc.dart';
import 'widgets/privacy_policy_widget.dart';
import 'widgets/registration_form_widget/registration_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamSubscription<dynamic>? userStream;

  @override
  void dispose() {
    nameController.dispose();
    countryController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
          title: l10n.signUpText, subtitileText: l10n.subtitleSignUpText),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RegistrationFormWidget(
                        nameController: nameController,
                        countryController: countryController,
                        phoneController: phoneController,
                        emailController: emailController,
                        passwordController: passwordController),
                    const PrivacyPolicyWidget(),
                    SizedBox(
                      height: 8.h,
                    ),
                    _signUpHandlingMethod(),
                    SizedBox(
                      height: 12.h,
                    ),
                    HorizontalDividerWithTextWidget(
                      text: l10n.orSingUpText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const SocialButtonRowWidget()
                  ],
                )),
          ),
        ),
      ),
    );
  }

  BlocListener<CreateUserBloc, CreateUserState> _signUpHandlingMethod() {
    return BlocListener<CreateUserBloc, CreateUserState>(
      listener: (context, state) {
        if (state.createUserStatus.isSucess) {
          final userBloc = context.read<UserBloc>()
            ..add(GetUserFireBase(email: emailController.text));

          userStream = userBloc.stream.listen((event) {
            if (event.userStatus.isLoaded &&
                event.userEnity.displayName != null) {
              context.read<AuthBloc>().add(LoginRequested(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim()));

              context.read<AccountBloc>().add(ToggleCheckboxEvent(
                  email: emailController.text,
                  password: passwordController.text,
                  checkRemember: true));
              //CustomDialog(context: context).showLoadingDialog();
              // Timer(const Duration(milliseconds: 500), () {
                
              // });
            } else {
              CustomDialog(context: context).showCustomDialog(
                notificationText: 'SignUp Error',
                dialogStatus: DialogStatus.error,
              );
            }
          });
        } else if (state.createUserStatus.isError) {
          CustomDialog(context: context).showCustomDialog(
            notificationText: 'SignUp Error',
            dialogStatus: DialogStatus.error,
          );
        }
      },
      child: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          return CustomElevatedButton(
            onPressed: () {
              final phoneNumber =
                  '+${state.countryCode} ${phoneController.text}';
              if (_formKey.currentState!.validate()) {
                context.read<CreateUserBloc>().add(ProcessCreateUserEvent(
                      email: emailController.text,
                      password: passwordController.text,
                      country: state.countryName,
                      phoneNumber: phoneNumber,
                      name: nameController.text,
                      image: TextConstant.imageUser,
                    ));

                CustomDialog(context: context).showLoadingDialog();
              }
            },
            textBtn: TextConstant.signUpText,
          );
        },
      ),
    );
  }
}
