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
import '../../../../widgets/custom_my_paint.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../blocs/add_passengers/add_passenger_bloc.dart';

class AddPassengersScreen extends StatelessWidget {
  const AddPassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            expandedHeight: 120.h,
            backgroundColor: ColorConstant.primaryColor,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: ColorConstant.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  height: 100.h,
                  child: CustomPaint(
                    painter: CustomMyPaint(),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 16,
                    child: Row(
                      children: [
                        const ButtonWidget(),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          context.l10n.addPassengerText,
                          style: context.appTextTheme.headlineLarge,
                        )
                      ],
                    ))
              ],
            ),
          ),
          const FormAddPassengerWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Builder(builder: (context) {
                final valuePassengers =
                    context.watch<ChoosePassengersBloc>().state;

                return BlocBuilder<AddPassengerBloc, AddPassengerState>(
                    builder: (context, state) {
                  return CustomElevatedButton(
                      onPressed: () {
                        CustomDialog(context: context).showLoadingDialog();
                        Timer(const Duration(milliseconds: 1500), () {
                          if (state.mapValueName.length <
                                  valuePassengers.passengers &&
                              state.addPassengerStatus.isLoaded) {
                            CustomDialog(context: context)
                                .showCustomDialogNoAutoOff(
                                    notificationText:
                                        'There are ${valuePassengers.passengers - state.mapValueName.length} passengers who have not entered information yet',
                                    dialogStatus: DialogStatus.error);
                          } else if (state.mapValueName.length ==
                                  valuePassengers.passengers &&
                              state.addPassengerStatus.isSucees) {
                            context.pop();
                          }
                        });
                      },
                      textBtn: context.l10n.doneBtnText);
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}

class FormAddPassengerWidget extends StatelessWidget {
  const FormAddPassengerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final valuePassengers = context.watch<ChoosePassengersBloc>().state;
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: valuePassengers.passengers, (context, index) {
      return PassengerItem(
        countPassengers: valuePassengers.passengers,
        index: index,
      );
    }));
  }
}

class PassengerItem extends StatefulWidget {
  const PassengerItem({
    required this.index,
    required this.countPassengers,
    super.key,
  });
  final int index;
  final int countPassengers;

  @override
  State<PassengerItem> createState() => _PassengerItemState();
}

class _PassengerItemState extends State<PassengerItem> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final indentityNumberController = TextEditingController();
  final emailController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _indentityNumberNode = FocusNode();
  final _emailNode = FocusNode();
  String keyMapNameAndEmail = '';

  @override
  void dispose() {
    nameController.dispose();
    indentityNumberController.dispose();
    emailController.dispose();

    _nameFocusNode.dispose();
    _indentityNumberNode.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _nameFocusNode.unfocus();
    _indentityNumberNode.unfocus();
    _emailNode.unfocus();
    if (next != null) {
      next.requestFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    //focus vào textfield đầu tiên của phần tử đầu tiên
    if (widget.index == 0) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _nameFocusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.always,
        child: BlocBuilder<AddPassengerBloc, AddPassengerState>(
          builder: (context, state) {
            if (state.addPassengerStatus.isSucees) {
              keyMapNameAndEmail =
                  state.mapValueIndentity[widget.index + 1].toString();
              nameController.text =
                  state.mapValueName[keyMapNameAndEmail].toString();

              indentityNumberController.text =
                  state.mapValueIndentity[widget.index + 1].toString();
              emailController.text =
                  state.mapEmail[keyMapNameAndEmail].toString();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Passengers ${widget.index + 1}',
                  style: context.appTextTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  focusNode: _nameFocusNode,
                  onFieldSubmitted: (value) {
                    if (state.addPassengerStatus.isSucees) {
                      context.read<AddPassengerBloc>().add(
                          UpdateNamePassengerEvent(
                              name: value, keyName: keyMapNameAndEmail));
                    }
                    _nextRequest(_indentityNumberNode);
                  },
                  validator: ValidatonFunction.validateName,
                  controller: nameController,
                  hintText: context.l10n.nameText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  focusNode: _indentityNumberNode,
                  onFieldSubmitted: (value) {
                    if (state.addPassengerStatus.isSucees) {
                      context.read<AddPassengerBloc>().add(
                          UpdateIndentityPassengerEvent(
                              indentityUpdate: value,
                              keyIndentity: widget.index + 1));
                    }
                    _nextRequest(_emailNode);
                  },
                  validator: ValidatonFunction.validateName,
                  controller: indentityNumberController,
                  textInputType: TextInputType.number,
                  hintText: 'Indentity Number',
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  validator: ValidatonFunction.validateName,
                  focusNode: _emailNode,
                  controller: emailController,
                  hintText: context.l10n.emailText,
                  onFieldSubmitted: (value) {
                    if (formKey.currentState!.validate()) {
                      if (state.addPassengerStatus.isSucees) {
                        context.read<AddPassengerBloc>().add(
                            UpdateEmailPassengerEvent(
                                emailUpdate: value,
                                keyEmail: keyMapNameAndEmail));
                      }
                      context.read<AddPassengerBloc>().add(
                          ProcessAddPassengerEvent(
                              countPassengers: widget.countPassengers,
                              keyMapIndentity: widget.index + 1,
                              email: emailController.text,
                              indentity: indentityNumberController.text,
                              namePassenger: nameController.text));
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
