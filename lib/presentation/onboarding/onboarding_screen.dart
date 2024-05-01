// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../core/utils/color_constant.dart';
import '../../core/utils/name_route.dart';
import '../../l10n/l10n.dart';
import '../../widgets/export_widgets.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.transparentColor,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                context.goNamed(loginRoute);
              },
              child: Text(
                l10n.skipText,
                style: theme.titleMedium
                    ?.copyWith(color: ColorConstant.primaryColor),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: PageView.builder(
                    itemCount: content.length,
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                              flex: 6,
                              child: CustomImageView(
                                radius: BorderRadius.circular(20.r),
                                imagePath: content[index].image,
                              )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                content[index].title,
                                style: theme.headlineMedium,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                content[index].subtitle,
                                style: theme.bodyMedium,
                              ),
                            ),
                          )
                        ],
                      );
                    })),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(
                          content.length,
                          (index) => BuildDotWidget(
                                currentIndex: currentIndex,
                                index: index,
                              )),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          if (currentIndex == content.length - 1) {
                            context.goNamed(loginRoute);
                          }
                          _controller?.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        child: Text(
                          currentIndex == content.length - 1
                              ? l10n.getStartedText
                              : l10n.nextText,
                          style: theme.titleMedium,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildDotWidget extends StatelessWidget {
  const BuildDotWidget({
    required this.currentIndex,
    required this.index,
    this.color,
    super.key,
  });

  final int currentIndex;
  final int index;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6,
        width: currentIndex == index ? 18 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: currentIndex == index
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color ?? ColorConstant.deepCarrotOrangeColor)
            : BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color ?? ColorConstant.grey700Color));
  }
}
