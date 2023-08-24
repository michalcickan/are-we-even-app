import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:areweeven/view_models/removable_list_item_view_model.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_section_title.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:flutter/material.dart';

class AppListItemsBuilder extends ListViewItemsBuilder {
  AppListItemsBuilder(
    super.buildItem,
    super.itemsCount,
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
    List<ListSection<String>> sections,
  ) {
    final indexMap = sections.indexMap;
    return AppListItemsBuilder(indexMap.keys.length, (context, index) {
      final indexKey = indexMap[index];
      if (indexKey == null) return const SizedBox();
      final section = sections[indexKey.sectionIndex];
      return indexKey.isSectionItem
          ? AWESectionTitle(
              section.title,
            )
          : _buildItem(section.viewModels[indexKey.itemIndex]);
    });
  }
}

extension _SimpleViewModelBuilders on ListItemViewModel {
  Widget get simpleListItem => AWEListItem(
        subtitle?.type == SubtitleType.selectionIndicator
            ? ListItemType.selectionIndicator
            : ListItemType.option,
        title: title,
        subtitle: subtitle?.text,
        onPressed: onPressed,
        iconData: iconData,
        key: ValueKey(id),
        trailing: trailingType?.widget,
      );
}

extension _RemovableViewModelBuilders on RemovableListItemViewModel {
  Widget get removableItem => Dismissible(
        key: Key(
          id.toString(),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          onPressedRemove();
          return Future.value(false);
        },
        child: simpleListItem,
      );
}

Widget _buildItem(dynamic viewModel) {
  if (viewModel is ListItemViewModel) {
    return viewModel.simpleListItem;
  }
  if (viewModel is RemovableListItemViewModel) {
    return viewModel.removableItem;
  }
  throw Exception("ViewModel type not implemented yet");
}

extension _Widgets on ListItemTrailingType {
  Widget get widget => when(
        navigation: () => const Icon(
          Icons.arrow_right,
        ),
        switcher: (value, onValueChanged) => Switch(
          value: value,
          onChanged: onValueChanged,
        ),
        checkbox: () => const Icon(
          Icons.check,
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
