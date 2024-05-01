// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../../core/app_export.dart';
import '../../../blocs/country_phone_number/country_phone_number_bloc.dart';
import '../country_code/country_code.dart';

class MenuCountryWidget extends StatefulWidget {
  const MenuCountryWidget({super.key, this.initCountry, this.coutryController});
  final String? initCountry;
  final TextEditingController? coutryController;

  @override
  State<MenuCountryWidget> createState() => _MenuCountryWidgetState();
}

class _MenuCountryWidgetState extends State<MenuCountryWidget> {
  //final countryController = TextEditingController();
  ValueNotifier<String> dropdownValue =
      ValueNotifier<String>(countryCode.keys.first);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropdownValue,
      builder: (_, __, ___) => DropdownMenu<String?>(
        //enableFilter: true, //đây là con dao 2 lưỡi
        //nói 2 lưỡi vì: nó tăng tốc độ search rất nhanh
        //nhưng nó có nhược điểm là khi đã chọn giá trị rồi.
        //Ấn lại vào menu thì chỉ hiện 1 nước đã chọn
        //Cân nhắc sử dụng nhớ đấy
        menuStyle: MenuStyle(
          shadowColor: MaterialStatePropertyAll<Color>(ColorConstant.greyColor),
          backgroundColor:
              MaterialStatePropertyAll<Color>(ColorConstant.whiteColor),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r))),
        ),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: ColorConstant.whiteColor, filled: true),
        width: ScreenUtil.defaultSize.width,
        menuHeight: ScreenUtil.defaultSize.height / 4,
        initialSelection: widget.initCountry,
        controller: widget.coutryController,
        requestFocusOnTap: true,
        hintText: TextConstant.countryText,
        onSelected: (String? value) {
          if (value != null) {
            dropdownValue.value = value;
            context
                .read<CountryPhoneNumberBloc>()
                .add(ProcessCountryPhoneNumberEvent(countryNameSelect: value));
          }
        },
        dropdownMenuEntries:
            countryCode.keys.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
            style: MenuItemButton.styleFrom(
                backgroundColor: ColorConstant.whiteColor),
          );
        }).toList(),
      ),
    );
  }
}
