import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_error_provider.g.dart';

@riverpod
class GlobalError extends _$GlobalError {
  @override
  String? build() {
    return null;
  }

  void showError(Object error) {
    state = error.toString();
  }
}
