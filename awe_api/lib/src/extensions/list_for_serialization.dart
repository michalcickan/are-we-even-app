extension ListForSerialization<T> on List<T> {
  List<T> Function(dynamic) fromJson(
      T Function(Map<String, dynamic>) parsingFunction) {
    return (json) => List.of(
          (json as List<dynamic>).map((e) => parsingFunction(e)),
        );
  }
}
