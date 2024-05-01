// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/name_route.dart';
import '../../../l10n/l10n.dart';
import '../blocs/bloc/account_bloc.dart';

class PasswordHandlingWidget extends StatelessWidget {
  const PasswordHandlingWidget(
      {required this.email, required this.password, super.key});
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CheckboxWidget(
          email: email,
          password: password,
        ),
        Text(l10n.remeberText),
        const Expanded(child: SizedBox()),
        TextButton(
            onPressed: () {
              context.goNamed(forgotRoute);
            },
            child: Text(
              l10n.forgotPasswordText,
              style:
                  theme.bodyMedium?.copyWith(color: ColorConstant.primaryColor),
            )),
      ],
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    required this.email,
    required this.password,
    super.key,
  });
  final TextEditingController email;
  final TextEditingController password;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  ValueNotifier<bool> checkBox = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: checkBox,
      builder: (_, __, ___) => Checkbox(
        fillColor: MaterialStatePropertyAll(ColorConstant.whiteColor),
        checkColor: ColorConstant.primaryColor,
        side: BorderSide(color: ColorConstant.whiteColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        value: checkBox.value,
        onChanged: (value) {
          checkBox.value = !checkBox.value;
          Logger().i('email: ${widget.email}, checkbox: ${checkBox.value}');
          context.read<AccountBloc>().add(ToggleCheckboxEvent(
              email: widget.email.text,
              password: widget.password.text,
              checkRemember: checkBox.value));
        },
      ),
    );
  }
}
