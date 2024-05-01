// Flutter imports:
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../core/app_export.dart';
import '../../../../widgets/export_widgets.dart';
import '../../../login/widgets/export_widgets_login.dart';
import '../../blocs/country/country_bloc.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({
    required this.nameController,
    required this.countryController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController countryController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passWordFocusNode = FocusNode();

  ValueNotifier<Country> selectedCountry =
      ValueNotifier<Country>(CountryParser.parseCountryCode('VN'));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    _passWordFocusNode.dispose();
    super.dispose();
  }

  void _nextRequest(FocusNode? next) {
    _nameFocusNode.unfocus();
    _phoneNumberFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _passWordFocusNode.unfocus();
    if (next != null) {
      next.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          focusNode: _nameFocusNode,
          onFieldSubmitted: (_) => _nextRequest(_phoneNumberFocusNode),
          controller: widget.nameController,
          hintText: TextConstant.nameText,
          validator: ValidatonFunction.validateName,
        ),
        SizedBox(
          height: 12.h,
        ),
        //const MenuCountryWidget(),
        ValueListenableBuilder(
          valueListenable: selectedCountry,
          builder: (_, __, ___) => GestureDetector(
            onTap: () {
              showCountryPicker(
                
                countryListTheme:
                    CountryListThemeData(bottomSheetHeight: 400.h),
                context: context,
                onSelect: (Country country) {
                  selectedCountry.value = country;
                  context.read<CountryBloc>().add(GetCountryName(
                      countryName:
                          selectedCountry.value.displayNameNoCountryCode,
                      countryCode: selectedCountry.value.phoneCode));
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Text(
                      '${selectedCountry.value.flagEmoji}  ${selectedCountry.value.displayNameNoCountryCode}'),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 12.h,
        ),
        ValueListenableBuilder(
          valueListenable: selectedCountry,
          builder: (_, __, ___) => CustomTextFormField(
            prefix: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('+${selectedCountry.value.phoneCode}'),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 2.w,
                  height: 30.h,
                  decoration: BoxDecoration(color: ColorConstant.grey400Color),
                )
              ],
            ),
            focusNode: _phoneNumberFocusNode,
            onFieldSubmitted: (_) => _nextRequest(_emailFocusNode),
            controller: widget.phoneController,
            hintText: TextConstant.phoneNumberText,
            textInputType: TextInputType.number,
            validator: ValidatonFunction.validateName,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextFormField(
          focusNode: _emailFocusNode,
          onFieldSubmitted: (_) => _nextRequest(_passWordFocusNode),
          controller: widget.emailController,
          hintText: TextConstant.emailText,
          validator: ValidatonFunction.validateName,
        ),
        SizedBox(
          height: 12.h,
        ),
        PasswordFormFieldWidget(
          passwordController: widget.passwordController,
          passwordFocusNode: _passWordFocusNode,
        ),
      ],
    );
  }
}



//TODO:Làm sau
// cải tiến để chọn mã vùng với những quốc gia có nhiều mã vùng

// class NumberPhoneWidget extends StatefulWidget {
//   const NumberPhoneWidget({super.key});

//   @override
//   State<NumberPhoneWidget> createState() => _NumberPhoneWidgetState();
// }

// class _NumberPhoneWidgetState extends State<NumberPhoneWidget> {
//   final countryController = TextEditingController();
//   ValueNotifier<String> dropdownValue =
//       ValueNotifier<String>(countryCode.values.first);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: dropdownValue,
//       builder: (_, __, ___) => DropdownMenu<String?>(
//         expandedInsets: null,
//         menuStyle: MenuStyle(
//           shadowColor: MaterialStatePropertyAll<Color>(ColorConstant.greyColor),
//           backgroundColor:
//               MaterialStatePropertyAll<Color>(ColorConstant.whiteColor),
//           shape: MaterialStatePropertyAll<OutlinedBorder>(
//               RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.r))),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//             fillColor: ColorConstant.whiteColor, filled: true),
//         width: 100.w,
//         menuHeight: ScreenUtil.defaultSize.height / 4,
//         initialSelection: dropdownValue.value,
//         controller: countryController,
//         requestFocusOnTap: true,
//         label: Text(TextConstant.phoneNumberText),
//         onSelected: (String? value) {
//           if (value != null) dropdownValue.value = value;
//         },
//         dropdownMenuEntries:
//             countryCode.values.map<DropdownMenuEntry<String>>((String value) {
//           return DropdownMenuEntry<String>(
//             value: value,
//             label: value,
//             style: MenuItemButton.styleFrom(
//                 backgroundColor: ColorConstant.whiteColor),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
