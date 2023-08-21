class ListSection<S, D> {
  final S title;
  final List<D> data;

  const ListSection(
    this.title,
    this.data,
  );

  D? getDataItemAtIndex(int index) => index == 0 ? null : data[index - 1];
}
