import 'package:areweeven/view_models/view_model.dart';

class ListSection<S> {
  final S title;
  final List<ViewModel<dynamic>> viewModels;

  const ListSection(
    this.title,
    this.viewModels,
  );

  int get totalItemsCount => viewModels.length + 1;

  int? getItemIndex(int index) => index == 0 ? null : index - 1;
}
