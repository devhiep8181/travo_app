import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_export.dart';

import '../../../l10n/l10n.dart';
import '../../../widgets/export_widgets.dart';

import '../book_and_review/blocs/room/room_choose_bloc.dart';

import '../widgets/subtitle_checkout_widget.dart';

import 'widgets/room_confirm_widget.dart';

class ComfirmScreen extends StatefulWidget {
  const ComfirmScreen({
    super.key,
  });

  @override
  State<ComfirmScreen> createState() => _ComfirmScreenState();
}

class _ComfirmScreenState extends State<ComfirmScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 3),
      ),
      body: RefreshIndicator(
        color: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.blueAccentColor,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<RoomChooseBloc, RoomChooseState>(
              builder: (context, state) {
                if (state.roomChooseStatus.isLoaded) {
                  final room = state.roomEntity;
                  return RoomConfirmWidget(room: room);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
