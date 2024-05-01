// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../core/app_export.dart';
import '../core/utils/color_constant.dart';
import '../presentation/onboarding/onboarding_screen.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.label,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.autofocus,
    this.textStyle,
    this.obscureText,
    this.textInputType,
    this.maxLine,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator,
    this.textInputAction,
    this.hintStyle,
    this.onChanged,
  });

  final Alignment? alignment;
  final double? width;
  final String? label;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLine;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormField(context),
          )
        : textFormField(context);
  }

  Widget textFormField(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus ?? false,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLine ?? 1,
      validator: validator,
      decoration: decoration(context),
      onChanged: onChanged,
    );
  }

  InputDecoration decoration(BuildContext context) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: ColorConstant.black87Color,
        fontSize: 14,
      ),
      border: InputBorder.none,
      floatingLabelStyle: TextStyle(
        color: ColorConstant.black87Color,
        fontSize: 16,
      ),
      fillColor: fillColor,
      filled: true,
      isDense: true,
      hintText: hintText,
      hintStyle: context.appTextTheme.bodyMedium?.copyWith(
          color: context.isAppInLightMode()
              ? ColorConstant.grey500Color
              : ColorConstant.blackColor),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
    );
  }
}
