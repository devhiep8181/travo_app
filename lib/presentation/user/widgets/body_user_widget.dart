import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_eleveted_button.dart';
import '../../auth/authen/auth_bloc.dart';
import 'user_setting_widget.dart';

class BodyUserWidget extends StatelessWidget {
  const BodyUserWidget({
    required this.appState,
    super.key,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.appStatus.contains(AppStatus.loaded.path)) {
          CustomDialog(context: context).showLoadingDialog();
        }
      },
      child: SliverList(
          delegate: SliverChildListDelegate([
        UserSettingWidget(
            leadingText: context.l10n.darkModeText,
            action: Switch(
                value: appState.valueCheckTheme,
                onChanged: (value) {
                  context
                      .read<AppBloc>()
                      .add(ChangeThemeAppEvent(appTheme: value));
                })),
        UserSettingWidget(
            leadingText: context.l10n.changeLanguage,
            action: Switch(
                value: appState.valueCheckLanguage,
                onChanged: (value) {
                  context
                      .read<AppBloc>()
                      .add(ChangLaguageAppEvent(appLanguage: value));
                })),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomElevatedButton(
            onPressed: () {
              // await AppCache.remove('Booking');
              //await HydratedBloc.storage.clear();

              context.read<AuthBloc>().add(LogoutRequested());
              CustomDialog(context: context).showLoadingDialog();
              Future<dynamic>.delayed(const Duration(seconds: 1)).then((value) {
                context.pushReplacementNamed(loginRoute);
              });
            },
            textBtn: context.l10n.logout,
          ),
        ),
      ])),
    );
  }
}
