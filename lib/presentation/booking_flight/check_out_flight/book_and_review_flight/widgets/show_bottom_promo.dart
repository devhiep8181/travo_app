import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_export.dart';
import '../../../../../widgets/custom_image_view.dart';
import '../../../../booking/book_and_review/blocs/promo/promo_bloc.dart';

class ShowBottomPromo {
  ShowBottomPromo({
    required this.context,
  });
  final BuildContext context;

  void buildBottomPromo() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ColoredBox(
          color: ColorConstant.grey200Color,
          child: Center(
            child: BlocBuilder<PromoBloc, PromoState>(
              builder: (context, state) {
                if (state.promoStatus.isLoaded) {
                  final listPromo = state.listPromo;
                  return ListView(
                    children: List.generate(
                        listPromo.length,
                        (index) => InkWell(
                              onTap: () {
                                context.read<PromoBloc>().add(ChoosePromoEvent(
                                    choosePromo: listPromo[index]));
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    color: state.choosePromo.code ==
                                            listPromo[index].code
                                        ? ColorConstant.primaryColor
                                            .withOpacity(0.6)
                                        : ColorConstant.whiteColor,
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                    title: Text(
                                      listPromo[index].code.toString(),
                                      style: context.appTextTheme.bodyLarge,
                                    ),
                                    trailing: CustomImageView(
                                        height: 30.h,
                                        width: 30.h,
                                        imagePath: listPromo[index].imgae),
                                  ),
                                ),
                              ),
                            )),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
