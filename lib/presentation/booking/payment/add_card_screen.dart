import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/cache/user_singleton.dart';
import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/export_widgets.dart';
import '../../signup/blocs/country/country_bloc.dart';
import 'bloc/bloc/card_bloc.dart';
import 'bloc/choose_card/bloc/choose_card_bloc.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController nameController =
      TextEditingController(text: UserSingleton().name);
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<Country> selectedCountry =
      ValueNotifier<Country>(CountryParser.parseCountryCode('VN'));

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _cardFocusNode = FocusNode();
  final FocusNode _expDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final FocusNode _countryFoucusNode = FocusNode();
  @override
  void initState() {
  
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
      _nameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    cardController.dispose();
    expDateController.dispose();
    cvvController.dispose();

    _nameFocusNode.dispose();
    _cardFocusNode.dispose();
    _countryFoucusNode.dispose();
    _cvvFocusNode.dispose();
    _expDateFocusNode.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _nameFocusNode.unfocus();
    _cardFocusNode.unfocus();
    _countryFoucusNode.unfocus();
    _expDateFocusNode.unfocus();
    _cvvFocusNode.unfocus();
    if (next != null) {
      //requestFocus: tập trung vào đối tượng focuseNode được truyền qua biến next
      next.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TextConstant.addCardBtnText),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: BlocBuilder<CardBloc, CardState>(
              builder: (context, state) {
                if (state.cardStatus.isLoaded) {
                  nameController.text = state.name;
                  expDateController.text = state.expDate;
                  cvvController.text = state.cVV;
                  cardController.text = state.cardNumber;
                }
                return Column(
                  children: [
                    CustomTextFormField(
                      validator: ValidatonFunction.validateName,
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (_) {
                        _nextRequest(_cardFocusNode);
                      },
                      controller: nameController,
                      hintText: context.l10n.nameText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.number,
                      focusNode: _cardFocusNode,
                      onFieldSubmitted: (_) => _nextRequest(_expDateFocusNode),
                      validator: ValidatonFunction.validateName,
                      controller: cardController,
                      prefix: CustomImageView(
                        margin: const EdgeInsets.all(8),
                        height: 40.h,
                        width: 40.w,
                        imagePath: Assets.images.visaGroup,
                      ),
                      hintText: TextConstant.cardNumberText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: CustomTextFormField(
                            textInputType: TextInputType.datetime,
                            focusNode: _expDateFocusNode,
                            onFieldSubmitted: (_) =>
                                _nextRequest(_cvvFocusNode),
                            controller: expDateController,
                            validator: ValidatonFunction.validateName,
                            hintText: 'Exp. Date',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: CustomTextFormField(
                            textInputType: TextInputType.number,
                            focusNode: _cvvFocusNode,
                            controller: cvvController,
                            validator: ValidatonFunction.validateName,
                            hintText: 'CVV',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    BlocBuilder<CountryBloc, CountryState>(
                      builder: (context, state) {
                        final checkStateCountryLoaded =
                            state.countryStatus.isLoaded;
                        return ValueListenableBuilder(
                          valueListenable: selectedCountry,
                          builder: (_, __, ___) => GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                countryListTheme: CountryListThemeData(
                                    bottomSheetHeight: 400.h),
                                context: context,
                                onSelect: (Country country) {
                                  selectedCountry.value = country;
                                  context.read<CountryBloc>().add(
                                      GetCountryName(
                                          countryName: selectedCountry
                                              .value.displayNameNoCountryCode,
                                          countryCode:
                                              selectedCountry.value.phoneCode));
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConstant.whiteColor,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 20),
                                  child: Text(checkStateCountryLoaded
                                      ? state.countryName
                                      : selectedCountry
                                          .value.displayNameNoCountryCode),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<CardBloc>().add(GetCardEvent(
                              name: nameController.text,
                              cardNumber: cardController.text,
                              expDate: expDateController.text,
                              cVV: cvvController.text,
                              countryName: selectedCountry
                                  .value.displayNameNoCountryCode));

                          //Sự kiện này đổi màu nút
                          context.read<ChooseCardBloc>().add(ImportCardEvent(
                              imagePath: Assets.images.creditGroup,
                              titlePayment: TextConstant.creditCardText));

                          CustomDialog(context: context).showLoadingDialog();
                          Timer(const Duration(seconds: 2), () {
                            context.pop();
                          });
                        }
                      },
                      textBtn: TextConstant.addCardBtnText,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
