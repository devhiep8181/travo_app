import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import 'widgets/show_bottom_promo.dart';

class AddPromoFlightScreen extends StatefulWidget {
  const AddPromoFlightScreen({super.key});

  @override
  State<AddPromoFlightScreen> createState() => _AddPromoFlightScreenState();
}

class _AddPromoFlightScreenState extends State<AddPromoFlightScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PromoBloc>().add(GetPromoEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.promoCodeText),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<PromoBloc, PromoState>(
              // buildWhen: (pre, current) {
              //   return pre.choosePromo != current.choosePromo;
              // },
              builder: (context, state) {
                return CustomTextFormField(
                  label: (state.promoStatus.isSuccess)
                      ? state.choosePromo.code
                      : l10n.addCouponCodeText,
                  hintText: l10n.addCouponCodeText,
                  suffix: InkWell(
                    onTap: () {
                      ShowBottomPromo(context: context).buildBottomPromo();
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorConstant.grey400Color),
                      child: Center(
                          child: Text(
                        l10n.addCodeBtnText,
                        textAlign: TextAlign.center,
                        style: context.appTextTheme.bodyMedium,
                      )),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocBuilder<PromoBloc, PromoState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  onPressed: () {
                    CustomDialog(context: context).showLoadingDialog();
                    Timer(const Duration(milliseconds: 1500), () {
                      if (state.promoStatus.isSuccess) {
                        context.pop();
                      } else {
                        CustomDialog(context: context)
                            .showCustomDialogNoAutoOff(
                                notificationText: 'Add Promo Code',
                                dialogStatus: DialogStatus.error);
                      }
                    });
                  },
                  textBtn: l10n.doneBtnText,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
