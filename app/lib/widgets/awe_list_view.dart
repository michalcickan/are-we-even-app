import 'package:flutter/material.dart';

import 'awe_empty_placeholder.dart';
import 'sizes.dart';

enum ListViewType {
  defaultIndentation,
}

abstract class ListViewItemsBuilder {
  final int itemsCount;
  final Widget Function(BuildContext, int) buildItem;

  ListViewItemsBuilder(
    this.itemsCount,
    this.buildItem,
  );
}

class AWEListView extends StatelessWidget {
  final ListViewType type;
  final ListViewItemsBuilder listViewItemsBuilder;
  final String emptyText;

  const AWEListView(
    this.type, {
    required this.emptyText,
    required this.listViewItemsBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sidePadding = type.padding;
    return listViewItemsBuilder.itemsCount > 0
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.small,
            ),
            itemBuilder: (context, index) {
              final child = listViewItemsBuilder.buildItem(context, index);
              return sidePadding != null
                  ? Padding(padding: sidePadding!, child: child)
                  : child;
            },
            itemCount: listViewItemsBuilder.itemsCount,
          )
        : Padding(
            padding: sidePadding!,
            child: AWEEmptyPlaceholder(
              EmptyPlaceholderType.list,
              text: emptyText,
            ),
          );
  }
}

extension _Styles on ListViewType {
  EdgeInsets? get padding {
    switch (this) {
      case ListViewType.defaultIndentation:
        return const EdgeInsets.only(
          right: Sizes.small,
          left: Sizes.small,
          bottom: Sizes.small,
        );
    }
  }
}
