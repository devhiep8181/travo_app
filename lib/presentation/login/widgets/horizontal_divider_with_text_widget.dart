// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/utils/color_constant.dart';

class HorizontalDividerWithTextWidget extends StatelessWidget {
  const HorizontalDividerWithTextWidget({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: ColorConstant.grey400Color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text),
        ),
        Expanded(
          child: Container(
            height: 2,
            color: ColorConstant.grey400Color,
          ),
        ),
      ],
    );
  }
}
