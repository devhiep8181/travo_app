import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/export_widgets.dart';
import '../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import 'blocs/contact/contact_bloc.dart';
import 'blocs/contact_details/contact_details_bloc.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key});

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    nameController.dispose();

    _nameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _nameFocusNode.unfocus();
    _phoneNumberFocusNode.unfocus();
    _emailFocusNode.unfocus();
    if (next != null) {
      next.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final modifyRoomBooking = context
        .select((ModifyOrChooseRoomBloc bloc) => bloc.state.modifyBookingRoom);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.contactDetailText,
        onPressed: () {
          if (modifyRoomBooking) {
            context.goNamed(modifyBookingRoomRoute);
          } else {
            context.pop();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state.contactStatus.isLoaded) {
                nameController.text = state.userEnity.displayName ?? '';
                emailController.text = state.userEnity.email;
                phoneController.text = state.userEnity.phoneNumber ?? '';
              }
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      validator: ValidatonFunction.validateName,
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (_) =>
                          _nextRequest(_phoneNumberFocusNode),
                      controller: nameController,
                      hintText: context.l10n.nameText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      validator: ValidatonFunction.validateName,
                      focusNode: _phoneNumberFocusNode,
                      onFieldSubmitted: (_) => _nextRequest(_emailFocusNode),
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      hintText: context.l10n.phoneNumberText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      validator: ValidatonFunction.validateName,
                      focusNode: _emailFocusNode,
                      controller: emailController,
                      hintText: context.l10n.emailText,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      l10n.subtitileEmail,
                      style: context.appTextTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //Lưu lại giá trị mới
                          context.read<ContactBloc>().add(UpdateContactEvent(
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                              email: emailController.text,
                              ));

                          context.read<ContactDetailsBloc>().add(
                              GetContactDetailsEvent(
                                  name: nameController.text,
                                  phoneNumber: phoneController.text,
                                  email: emailController.text));
                          CustomDialog(context: context).showLoadingDialog();
                          Timer(const Duration(seconds: 2), () {
                            if (modifyRoomBooking) {
                              context.goNamed(modifyBookingRoomRoute);
                            } else {
                              context.pop();
                            }
                          });
                        }
                      },
                      textBtn: l10n.doneBtnText,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
