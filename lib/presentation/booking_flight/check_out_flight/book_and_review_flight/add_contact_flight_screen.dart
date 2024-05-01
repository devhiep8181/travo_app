import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../../booking/book_and_review/blocs/contact_details/contact_details_bloc.dart';

class AddContactFlightScreen extends StatefulWidget {
  const AddContactFlightScreen({super.key});

  @override
  State<AddContactFlightScreen> createState() => _AddContactFlightScreenState();
}

class _AddContactFlightScreenState extends State<AddContactFlightScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFoucs = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _nameFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFoucs.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _nameFocus.unfocus();
    _emailFocus.unfocus();
    _phoneFoucs.unfocus();
    if (next != null) {
      next.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.contactDetailText,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state.contactStatus.isLoaded ||
                  state.contactStatus.isSuccess) {
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
                      focusNode: _nameFocus,
                      onFieldSubmitted: (_) => _nextRequest(_phoneFoucs),
                      controller: nameController,
                      hintText: context.l10n.nameText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      validator: ValidatonFunction.validateName,
                      focusNode: _phoneFoucs,
                      onFieldSubmitted: (_) => _nextRequest(_emailFocus),
                      controller: phoneController,
                      hintText: context.l10n.phoneNumberText,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      focusNode: _emailFocus,
                      validator: ValidatonFunction.validateName,
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
                        //Lưu lại giá trị mới
                        if (_formKey.currentState!.validate()) {
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
                          Timer(const Duration(milliseconds: 1800), () {
                            context.pop();
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
