// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../core/app_export.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstant.primaryColor,
        unselectedItemColor: ColorConstant.grey400Color,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: TextConstant.homeLabel),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: TextConstant.favouriteLabel),
          BottomNavigationBarItem(
              icon: const Icon(Icons.card_travel),
              label: TextConstant.paymentLabel),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: TextConstant.userLabel)
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
