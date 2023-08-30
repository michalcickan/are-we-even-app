import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/view_models/card_list_item_view_model.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:areweeven/view_models/removable_list_item_view_model.dart';
import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_section_title.dart';
import 'package:flutter/material.dart';

import 'list_item_builder_view_model_widgets.dart';

class AppListItemsBuilder extends ListViewItemsBuilder {
  AppListItemsBuilder(
    super.itemsCount,
    super.buildItem,
  );

  factory AppListItemsBuilder.fromViewModels(
    List<dynamic> viewModels,
  ) {
    return AppListItemsBuilder(
      viewModels.length,
      (context, index) => _buildItem(viewModels[index]),
    );
  }

  factory AppListItemsBuilder.fromSections(
    List<ListSection> sections,
  ) {
    final indexMap = sections.indexMap;
    return AppListItemsBuilder(indexMap.keys.length, (context, index) {
      final indexKey = indexMap[index];
      if (indexKey == null) return const SizedBox();
      final section = sections[indexKey.sectionIndex];
      return indexKey.isSectionItem
          ? _buildSectionHeader(section.title, section.rightItem)
          : _buildItem(section.viewModels[indexKey.itemIndex]);
    });
  }
}

Widget _buildSectionHeader(dynamic title, SectionRightItem? rightItem) {
  if (title is String) {
    return AWESectionTitle(
      title,
      rightItem: rightItem?.widget,
    );
  }
  throw Exception("Other types are not implemented yet");
}

Widget _buildItem(dynamic viewModel) {
  if (viewModel is RemovableListItemViewModel) {
    return viewModel.removableItem;
  }
  if (viewModel is ListItemViewModel) {
    return viewModel.simpleListItem;
  }
  if (viewModel is CardListItemViewModel) {
    return viewModel.cardItem;
  }

  throw Exception("ViewModel type not implemented yet");
}

extension _RightItemWidget on SectionRightItem {
  Widget? get widget => when(
        () => null,
        more: (title, onPressed) => AWETextButton(
          TextButtonType.section,
          text: title,
          onPressed: onPressed,
        ),
      );
}

extension _Computations<T> on List<ListSection<T>> {
  Map<int, _IndexKey> get indexMap {
    final indexMap = <int, _IndexKey>{};
    int currentIndex = 0;

    for (int sectionIndex = 0; sectionIndex < length; sectionIndex++) {
      final section = this[sectionIndex];
      indexMap[currentIndex] = _IndexKey(sectionIndex, 0, true);

      for (int itemIndex = 0;
          itemIndex < section.viewModels.length;
          itemIndex++) {
        currentIndex++;
        indexMap[currentIndex] = _IndexKey(sectionIndex, itemIndex, false);
      }
      currentIndex++;
    }

    return indexMap;
  }
}

class _IndexKey {
  int sectionIndex;
  int itemIndex;
  bool isSectionItem;

  _IndexKey(
    this.sectionIndex,
    this.itemIndex,
    this.isSectionItem,
  );
}
