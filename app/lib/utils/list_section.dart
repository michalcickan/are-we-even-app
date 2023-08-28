import 'package:areweeven/view_models/view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_section.freezed.dart';

@freezed
class SectionRightItem with _$SectionRightItem {
  const factory SectionRightItem() = _SectionRightItem;

  const factory SectionRightItem.more(
    String text,
    void Function() onPressed,
  ) = More;
}

class ListSection<S> {
  final S title;
  final List<ViewModel<dynamic>> viewModels;
  final SectionRightItem? rightItem;

  const ListSection(
    this.title,
    this.viewModels, {
    this.rightItem,
  });

  int get totalItemsCount => viewModels.length + 1;

  int? getItemIndex(int index) => index == 0 ? null : index - 1;
}
