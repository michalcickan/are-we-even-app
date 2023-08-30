import 'package:areweeven/view_models/card_list_item_view_model.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:areweeven/view_models/removable_list_item_view_model.dart';
import 'package:areweeven/view_models/text_deliminator.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';

extension _TextDeliminatorWidget on TextDeliminator {
  Widget get widget => when(
        simpleText: (text) => Text(text),
        arrowDown: (additionalInfo) {
          const iconWidget = Icon(Icons.arrow_downward);
          return additionalInfo != null
              ? Column(
                  children: [
                    Text(
                      additionalInfo!,
                    ),
                    iconWidget
                  ],
                )
              : iconWidget;
        },
      );
}

extension Widgets on ListItemTrailingType {
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

extension SimpleViewModelBuilders on ListItemViewModel {
  Widget get simpleListItem => AWEListTile(
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

extension RemovableViewModelBuilders on RemovableListItemViewModel {
  Widget get removableItem => Dismissible(
        key: Key(
          id.toString(),
        ),
        direction: DismissDirection.endToStart,
        // dismissThresholds: {DismissDirection.endToStart: 10.0},
        background: const AWEDismissibleBackground(
          DismissibleBackgroundType.delete,
        ),
        confirmDismiss: (direction) {
          onPressedRemove();
          return Future.value(false);
        },
        child: simpleListItem,
      );
}

extension CardListItemViewModelBuilders on CardListItemViewModel {
  Widget get cardItem => AWECard(
        CardType.defaultIndentation,
        child: Column(
          children: [
            Text(upperText),
            if (textDeliminator != null)
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AWESizes.small,
                  ),
                  child: textDeliminator!.widget),
            Text(bottomText),
          ],
        ),
      );
}
