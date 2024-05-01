import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_eleveted_button.dart';
import '../widgets/custom_tag_checkout_widget.dart';
import '../widgets/subtitle_checkout_widget.dart';
import 'bloc/choose_card/bloc/choose_card_bloc.dart';
import 'credit_card_widget.dart';

class PaymentBookingScreen extends StatelessWidget {
  const PaymentBookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 2),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CustomTagCheckoutWidget(
            textTitleTag: l10n.miniMarketText,
            imagePath: Assets.images.marketGroup,
            onTap: () {
              context.read<ChooseCardBloc>().add(ImportCardEvent(
                  imagePath: Assets.images.marketGroup,
                  titlePayment: TextConstant.miniMarketText));
            },
            hiddenBtn: true,
            hiddenDotTopRight: false,
          ),
          const CreditCardWidget(),
          CustomTagCheckoutWidget(
            textTitleTag: l10n.bankTransferText,
            imagePath: Assets.images.bankGroup,
            onTap: () {
              context.read<ChooseCardBloc>().add(ImportCardEvent(
                  imagePath: Assets.images.bankGroup,
                  titlePayment: TextConstant.bankTransferText));
            },
            hiddenBtn: true,
            hiddenDotTopRight: false,
          ),
          BlocBuilder<ChooseCardBloc, ChooseCardState>(
              builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: CustomElevatedButton(
                onPressed: () {
                  CustomDialog(context: context).showLoadingDialog();
                  if (state.titlePayment.isEmpty) {
                    Future<dynamic>.delayed(const Duration(milliseconds: 1300))
                        .then((_) {
                      CustomDialog(context: context).showCustomDialogNoAutoOff(
                          notificationText: 'No payment information available',
                          dialogStatus: DialogStatus.error);
                    });
                  } else {
                    //1000 milisecond = 1 seconds
                    Timer(const Duration(milliseconds: 1200), () {
                      context.goNamed(confirmRoute);
                    });
                  }
                },
                textBtn: l10n.doneBtnText,
              ),
            );
          })
        ]),
      ),
    );
  }
}
