// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/text_constant.dart';
import '../../../core/utils/validation_functions.dart';
import '../../../widgets/custom_text_form_field.dart';

class BuildInputField extends StatefulWidget {
  const BuildInputField({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passWordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    //Khởi động sẽ focus vào ô email luôn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _emailFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passWordFocusNode.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _emailFocusNode.unfocus();
    _passWordFocusNode.unfocus();
    if (next != null) {
      next.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextFormField(
          focusNode: _emailFocusNode,
          controller: widget.emailController,
          onFieldSubmitted: (_) => _nextRequest(_passWordFocusNode),
          hintText: TextConstant.emailText,
          //TODO: VALIDATOR
          validator: ValidatonFunction.validateName,
        ),
        SizedBox(
          height: 20.h,
        ),
        PasswordFormFieldWidget(
          passwordController: widget.passwordController,
          passwordFocusNode: _passWordFocusNode,
        ),
      ],
    );
  }
}

class PasswordFormFieldWidget extends StatefulWidget {
  const PasswordFormFieldWidget({
    required this.passwordController,
    required this.passwordFocusNode,
    super.key,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  @override
  State<PasswordFormFieldWidget> createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  ValueNotifier<bool> checkVisiPassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: checkVisiPassword,
      builder: (_, __, ___) => CustomTextFormField(
        focusNode: widget.passwordFocusNode,
        obscureText: checkVisiPassword.value,
        //autofocus: true,
        controller: widget.passwordController,
        hintText: TextConstant.passwordText,
        //TODO:VALIDATOR2
        validator: ValidatonFunction.validateName,
        suffix: IconButton(
            color: ColorConstant.greyColor,
            onPressed: () {
              checkVisiPassword.value = !checkVisiPassword.value;
            },
            icon: checkVisiPassword.value
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility)),
      ),
    );
  }
}
