import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../book_and_review/blocs/contact_details/contact_details_bloc.dart';
import '../payment/credit_card_widget.dart';
import 'custom_tag_checkout_widget.dart';

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return SliverToBoxAdapter(
        child: BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
      builder: (context, state) {
        if (state.contactDetailsStatus.isLoaded) {
          return Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
            child: InkWell(
              onTap: () {
                context.goNamed(contactDetailsRoute);
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
                                imagePath: Assets.images.userGroup,
                                radius: BorderRadius.circular(12.r))),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(l10n.contactDetailText,
                                style: theme.titleMedium),
                          ),
                        ),
                      ],
                    ),
                    InfoCardElement(
                      content: state.name,
                    ),
                    InfoCardElement(
                      content: state.email,
                      backgroundColor:
                          ColorConstant.red600Color.withOpacity(0.8),
                      icon: Icons.email,
                    ),
                    InfoCardElement(
                      content: state.phoneNumber,
                      backgroundColor: ColorConstant.pinkColor,
                      icon: Icons.phone,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return CustomTagCheckoutWidget(
          imagePath: Assets.images.userGroup,
          textTitleTag: l10n.contactDetailText,
          textBtn: l10n.addContactBtnText,
          onTap: () {
            context.goNamed(contactDetailsRoute);
          },
        );
      },
    ));
  }
}

//Cái này đang chưa tận dụng được hết
class ContactDetailsCard extends StatelessWidget {
  const ContactDetailsCard({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
        builder: (context, state) {
          if (state.contactDetailsStatus.isLoaded) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
              child: InkWell(
                onTap: onTap ??
                    () {
                      context.goNamed(contactDetailsRoute);
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
                                  imagePath: Assets.images.userGroup,
                                  radius: BorderRadius.circular(12.r))),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(context.l10n.contactDetailText,
                                  style: context.appTextTheme.titleMedium),
                            ),
                          ),
                        ],
                      ),
                      InfoCardElement(
                        content: state.name,
                      ),
                      InfoCardElement(
                        content: state.email,
                        backgroundColor:
                            ColorConstant.red600Color.withOpacity(0.8),
                        icon: Icons.email,
                      ),
                      InfoCardElement(
                        content: state.phoneNumber,
                        backgroundColor: ColorConstant.pinkColor,
                        icon: Icons.phone,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return CustomTagCheckoutWidget(
            imagePath: Assets.images.userGroup,
            textTitleTag: context.l10n.contactDetailText,
            textBtn: context.l10n.addContactBtnText,
            onTap: onTap ??
                () {
                  context.goNamed(contactDetailsRoute);
                },
          );
        },
      ),
    );
  }
}
