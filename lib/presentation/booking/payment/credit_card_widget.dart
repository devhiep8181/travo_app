import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../widgets/custom_tag_checkout_widget.dart';
import 'bloc/bloc/card_bloc.dart';
import 'bloc/choose_card/bloc/choose_card_bloc.dart';


class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dotValue = context
        .select((ChooseCardBloc bloc) => bloc.state.chooseCard.entries.first);

    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        if (state.cardStatus.isLoaded) {
          return Padding(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
              child: InkWell(
                onTap: onTap ??
                    () {
                      context.goNamed(addCardRoute);
                    },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: CustomImageView(
                                  height: 40,
                                  width: 40,
                                  imagePath: Assets.images.creditGroup,
                                  radius: BorderRadius.circular(12.r))),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                l10n.creditCardText,
                                style: theme.titleMedium,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: dotValue.value == true &&
                                    dotValue.key == TextConstant.creditCardText
                                ? ColorConstant.greenColor
                                : ColorConstant.grey500Color.withOpacity(0.5),
                            radius: 12.r,
                          ),
                        ],
                      ),
                      InfoCardElement(content: state.name),
                      InfoCardElement(
                        content: state.cardNumber,
                        backgroundColor:
                            ColorConstant.red600Color.withOpacity(0.8),
                        icon: Icons.card_travel_outlined,
                      ),
                      InfoCardElement(
                        content: state.expDate,
                        backgroundColor: ColorConstant.pinkColor,
                        icon: Icons.date_range,
                      ),
                      InfoCardElement(
                        content: state.cVV,
                        backgroundColor:
                            ColorConstant.amberColor.withOpacity(0.6),
                        icon: Icons.numbers,
                      ),
                      InfoCardElement(
                        content: state.countryName,
                        backgroundColor: ColorConstant.blueVioletColor,
                        icon: Icons.language,
                      ),
                    ],
                  ),
                ),
              ));
        }
        return CustomTagCheckoutWidget(
          textTitleTag: l10n.creditCardText,
          textBtn: l10n.addCardBtnText,
          imagePath: Assets.images.creditGroup,
          onTap: onTap ??
              () {
                context.goNamed(addCardRoute);
              },
          hiddenDotTopRight: false,
        );
      },
    );
  }
}

class InfoCardElement extends StatelessWidget {
  const InfoCardElement({
    required this.content,
    this.icon,
    this.backgroundColor,
    super.key,
  });

  final Color? backgroundColor;
  final String content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor:
                backgroundColor ?? ColorConstant.primaryColor.withOpacity(0.8),
            child: Icon(
              icon ?? Icons.person,
              color: ColorConstant.whiteColor,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            content,
            style: context.appTextTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
