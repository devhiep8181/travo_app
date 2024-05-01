import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_export.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/custom_image_view.dart';
import '../../../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../../../booking/widgets/custom_tag_checkout_widget.dart';

class PromoFlightWidget extends StatelessWidget {
  const PromoFlightWidget({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<PromoBloc, PromoState>(
        builder: (context, state) {
          if (state.promoStatus.isSuccess) {
            final promoEntity = state.choosePromo;
            return InkWell(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            height: 40.h,
                            width: 40.w,
                            imagePath: Assets.images.discountGroup,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(context.l10n.promoCodeText,
                              style: context.appTextTheme.titleMedium
                                  ?.copyWith(color: ColorConstant.black87Color)),
                        ],
                      ),
                      ListTile(
                        title: Text(promoEntity.code.toString()),
                        subtitle:
                            Text('${promoEntity.endow} - ${promoEntity.price}%'),
                        leading: CustomImageView(
                          height: 30.h,
                          width: 30.w,
                          imagePath: promoEntity.imgae,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return CustomTagCheckoutWidget(
            imagePath: Assets.images.discountGroup,
            textTitleTag: context.l10n.promoCodeText,
            textBtn: context.l10n.addPromoCodeBtnText,
            onTap: onTap,
          );
        },
      ),
    );
  }
}
