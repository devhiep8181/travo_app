import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../booking/payment/bloc/choose_card/bloc/choose_card_bloc.dart';
import '../../../booking/payment/credit_card_widget.dart';
import '../../../booking/widgets/custom_tag_checkout_widget.dart';
import '../../../booking/widgets/subtitle_checkout_widget.dart';

class PaymentFlightScreen extends StatelessWidget {
  const PaymentFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 2),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return Column(children: [
              CustomTagCheckoutWidget(
                textTitleTag: context.l10n.miniMarketText,
                imagePath: Assets.images.marketGroup,
                onTap: () {
                  context.read<ChooseCardBloc>().add(ImportCardEvent(
                      imagePath: Assets.images.marketGroup,
                      titlePayment: TextConstant.miniMarketText));
                },
                hiddenBtn: true,
                hiddenDotTopRight: false,
              ),
              CreditCardWidget(
                onTap: () {
                  context.goNamed(addCardFlightRoute);
                },
              ),
              CustomTagCheckoutWidget(
                textTitleTag: context.l10n.bankTransferText,
                imagePath: Assets.images.bankGroup,
                onTap: () {
                  context.read<ChooseCardBloc>().add(ImportCardEvent(
                      imagePath: Assets.images.bankGroup,
                      titlePayment: TextConstant.bankTransferText));
                },
                hiddenBtn: true,
                hiddenDotTopRight: false,
              ),
              const BtnProcessPaymentFlightWidget()
            ]);
          }))
        ],
      ),
    );
  }
}

class BtnProcessPaymentFlightWidget extends StatelessWidget {
  const BtnProcessPaymentFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paymentFlight = context.watch<ChooseCardBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomElevatedButton(
        onPressed: () {
          CustomDialog(context: context).showLoadingDialog();
          Timer(const Duration(milliseconds: 1800), () {
            if (paymentFlight.chooseCard.isEmpty) {
              CustomDialog(context: context).showCustomDialog(
                notificationText: 'Payment method has not been selected',
                dialogStatus: DialogStatus.error,
              );
            } else {
              context.goNamed(confirmFlightRoute);
            }
          });
        },
        textBtn: context.l10n.doneBtnText,
      ),
    );
  }
}
