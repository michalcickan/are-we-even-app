import 'dart:math';

import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/tab_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  ConsumerState<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  late List<_TabInfo> _tabs;

  @override
  void initState() {
    final localization = ref.read(localizationProvider);
    _tabs = [
      _TabInfo(
        location: const HomeRoute().location,
        name: localization.homeTabTitle,
        icon: Icons.home,
        go: const HomeRoute().go,
      ),
      _TabInfo(
        location: const GroupsRoute().location,
        name: localization.groupsTabTitle,
        icon: Icons.group,
        go: const GroupsRoute().go,
      ),
      _TabInfo(
        location: const SettingsRoute().location,
        name: localization.settingsTabTitle,
        icon: Icons.settings,
        go: const SettingsRoute().go,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _tabs.getIndexOf(GoRouter.of(context).location);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _tabs[index].go(context),
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
}

extension _Helpers on List<_TabInfo> {
  int getIndexOf(String location) => max(
        indexWhere((element) => element.location == location),
        0,
      );
}

class _TabInfo {
  final String location;
  final String name;
  final IconData icon;
  final void Function(BuildContext) go;

  const _TabInfo({
    required this.location,
    required this.name,
    required this.icon,
    required this.go,
  });
}
