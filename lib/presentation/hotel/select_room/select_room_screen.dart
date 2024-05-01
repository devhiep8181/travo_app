import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_export.dart';
import '../blocs/room/room_bloc.dart';

import 'blocs/bloc/id_room_bloc.dart';
import 'widgets/appbar_room_widget.dart';
import 'widgets/body_room_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.blueAccentColor,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            const AppBarRoomWidget(),
            BlocBuilder<IdRoomBloc, IdRoomState>(
              builder: (context, state) {
                if (state is IdRoomLoaded) {
                  context
                      .read<RoomBloc>()
                      .add(GetRoomEvent(idHotel: state.idRoom));
                  return const BodyRoomWidget();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
