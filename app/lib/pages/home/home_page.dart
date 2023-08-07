import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollablePageWithBottomButton(
      bottomButtonTitle: "logout",
      title: "Home",
      bottomButtonOnPressed: () {
        ref.read(authProvider.notifier).logout();
      },
      children: const [],
    );
  }
}
