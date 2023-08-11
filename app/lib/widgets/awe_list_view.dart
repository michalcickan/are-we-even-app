import 'package:flutter/material.dart';

import 'sizes.dart';

enum ListViewType {
  defaultIndentation,
}

class AWEListView extends StatelessWidget {
  final ListViewType type;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;

  const AWEListView(
    this.type, {
    required this.itemBuilder,
    this.itemCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sidePadding = type.padding;
    return ListView.builder(
      itemBuilder: (context, index) {
        final child = itemBuilder(context, index);
        return sidePadding != null
            ? Padding(padding: sidePadding!, child: child)
            : child;
      },
      itemCount: itemCount,
    );
  }
}

extension _Styles on ListViewType {
  EdgeInsets? get padding {
    switch (this) {
      case ListViewType.defaultIndentation:
        return const EdgeInsets.only(
          right: Sizes.medium,
          left: Sizes.medium,
          bottom: Sizes.small,
        );
    }
  }
}
