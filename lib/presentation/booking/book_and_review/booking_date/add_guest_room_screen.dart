import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/l10n.dart';
import '../../../../widgets/export_widgets.dart';

import 'choose_guest_widget.dart';
import 'choose_room_widget.dart';

class AddGuestRoomSreen extends StatefulWidget {
  const AddGuestRoomSreen({super.key});

  @override
  State<AddGuestRoomSreen> createState() => _AddGuestRoomSreenState();
}

class _AddGuestRoomSreenState extends State<AddGuestRoomSreen> {
  TextEditingController valueGuest = TextEditingController();
  TextEditingController valueRoom = TextEditingController();

  @override
  void dispose() {
    valueGuest.dispose();
    valueRoom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.addGuestRoom,
        fontSizeTitle: 25.sp,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ChooseGuestWidget(valueGuest: valueGuest),
            SizedBox(
              height: 24.h,
            ),
            ChooseRoomWidget(valueRoom: valueRoom),
            SizedBox(
              height: 24.h,
            ),
            CustomElevatedButton(
              textBtn: l10n.doneBtnText,
              onPressed: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
