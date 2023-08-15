import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin UpdateValue<T> on AutoDisposeNotifier<T> {
  void updateValue(T value) {
    state = value;
  }
}
