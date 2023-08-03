import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class LoadingState<T> with _$LoadingState<T> {
  ///Initial
  const factory LoadingState.initial() = _LoadingStateInitial;

  ///Loading
  const factory LoadingState.loading() = _LoadingStateLoading;

  ///Data
  const factory LoadingState.data({required T model}) = _LoadingStateData;

  ///Error
  const factory LoadingState.error([String? error]) = _LoadingStateError;
}
