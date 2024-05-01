// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// Package imports:


import '../../app/bloc/app_bloc.dart';
import 'widgets/app_bar_user_widget.dart';
import 'widgets/body_user_widget.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppBloc>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarUserWidget(),
          BodyUserWidget(appState: appState),
        ],
      ),
    );
  }
}






