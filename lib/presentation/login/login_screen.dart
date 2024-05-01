// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../core/utils/name_route.dart';
import '../../l10n/l10n.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/export_widgets.dart';
import '../auth/authen/auth_bloc.dart';
import '../auth/user/user_bloc.dart';
import 'blocs/bloc/account_bloc.dart';
import 'widgets/export_widgets_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AccountBloc accountBloc;
  late StreamSubscription<dynamic> accountStream;
  late final AuthBloc authBloc;
  bool? get validate => _formKey.currentState?.validate();

  @override
  void initState() {
    super.initState();
    accountBloc = context.read<AccountBloc>()..add(InitAccountEvent());
    accountStream = accountBloc.stream.listen((event) {
      Future<dynamic>.delayed(Duration.zero).then((_) {
        if (event is InitAccountState) {
          emailController.text = event.email;
          passwordController.text = event.password;
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    accountStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
          hintLeading: true,
          title: l10n.loginText,
          subtitileText: l10n.subtitleLoginText),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildInputField(
                        emailController: emailController,
                        passwordController: passwordController),
                    PasswordHandlingWidget(
                      email: emailController,
                      password: passwordController,
                    ),
                    _loginHandingMethod(context),
                    SizedBox(
                      height: 12.h,
                    ),
                    HorizontalDividerWithTextWidget(
                      text: l10n.orLoginText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const SocialButtonRowWidget(),
                    SizedBox(
                      height: 8.h,
                    ),
                    const SignUpRowWithTextWidget(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  BlocListener<AuthBloc, AuthState> _loginHandingMethod(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenAppSate) {
            CustomDialog(context: context).showLoadingDialog();
            Future<dynamic>.delayed(const Duration(seconds: 2)).then((value) {
              context.goNamed(homeRoute);
            });
          } else if (state is ErrorAppState) {
            CustomDialog(context: context).showCustomDialogNoAutoOff(
                notificationText: 'Account or password is incorrect',
                dialogStatus: DialogStatus.error);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    if (validate != null && validate == true) {
                      authBloc = context.read<AuthBloc>()
                        ..add(LoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));

                      context.read<AccountBloc>().add(ToggleCheckboxEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          checkRemember: true));

                      context
                          .read<UserBloc>()
                          .add(GetUserFireBase(email: emailController.text));

                      CustomDialog(context: context).showLoadingDialog();
                    }
                  },
                  child: Text(l10n.loginText)),
            ),
          ],
        ));
  }
}
