// Flutter imports:
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.child,
    this.textBtn,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.focusNode,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  });
  final String? textBtn;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final FocusNode? focusNode;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: onPressed ?? () {}, child: child ?? Text(textBtn ?? ''))),
      ],
    );
  }
}
