import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/widget_ref_listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  AppScaffold({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final List<_TabInfo> _tabs = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = ref.watch(localizationProvider);
    ref.registerErrorListener();
    ref.registerDialogListener(
      localizations,
      context,
    );
    if (_tabs.isEmpty) {
      _tabs.addAll(
        _makeTabs(
          ref.watch(
            localizationProvider,
          ),
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.name,
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTap(int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Iterable<_TabInfo> _makeTabs(AppLocalizations localizations) => [
        _TabInfo(
          name: localizations.homeTabTitle,
          icon: Icons.home,
        ),
        _TabInfo(
          name: localizations.groupsTabTitle,
          icon: Icons.group,
        ),
        _TabInfo(
          name: localizations.settingsTabTitle,
          icon: Icons.settings,
        ),
      ];
}

class _TabInfo {
  final String name;
  final IconData icon;

  const _TabInfo({
    required this.name,
    required this.icon,
  });
}
