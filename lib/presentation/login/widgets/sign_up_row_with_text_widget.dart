// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';

class SignUpRowWithTextWidget extends StatelessWidget {
  const SignUpRowWithTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(context.l10n.doNotAcountText),
        TextButton(
            onPressed: () {
              context.goNamed(signupRoute);
            },
            child: Text(
              context.l10n.signUpText,
              style: context.appTextTheme
                  .bodyMedium
                  ?.copyWith(color: ColorConstant.primaryColor),
            ))
      ],
    );
  }
}
