// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../core/app_export.dart';
import '../../l10n/l10n.dart';
import '../../widgets/export_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
          fontSizeTitle: 28.sp,
          title: l10n.forgotPasswordText,
          subtitileText: l10n.subtitleForgotPasswordText),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      hintText: TextConstant.emailText,
                      validator: ValidatonFunction.validateName,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomElevatedButton(
                      textBtn: l10n.btnSendText,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
