// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'awe_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListItemTrailingType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigation,
    required TResult Function(bool value, void Function(bool) onValueChanged)
        switcher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? navigation,
    TResult? Function(bool value, void Function(bool) onValueChanged)? switcher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigation,
    TResult Function(bool value, void Function(bool) onValueChanged)? switcher,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArrowRight value) navigation,
    required TResult Function(Switcher value) switcher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArrowRight value)? navigation,
    TResult? Function(Switcher value)? switcher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArrowRight value)? navigation,
    TResult Function(Switcher value)? switcher,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListItemTrailingTypeCopyWith<$Res> {
  factory $ListItemTrailingTypeCopyWith(ListItemTrailingType value,
          $Res Function(ListItemTrailingType) then) =
      _$ListItemTrailingTypeCopyWithImpl<$Res, ListItemTrailingType>;
}

/// @nodoc
class _$ListItemTrailingTypeCopyWithImpl<$Res,
        $Val extends ListItemTrailingType>
    implements $ListItemTrailingTypeCopyWith<$Res> {
  _$ListItemTrailingTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ArrowRightCopyWith<$Res> {
  factory _$$ArrowRightCopyWith(
          _$ArrowRight value, $Res Function(_$ArrowRight) then) =
      __$$ArrowRightCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArrowRightCopyWithImpl<$Res>
    extends _$ListItemTrailingTypeCopyWithImpl<$Res, _$ArrowRight>
    implements _$$ArrowRightCopyWith<$Res> {
  __$$ArrowRightCopyWithImpl(
      _$ArrowRight _value, $Res Function(_$ArrowRight) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ArrowRight implements ArrowRight {
  const _$ArrowRight();

  @override
  String toString() {
    return 'ListItemTrailingType.navigation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArrowRight);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigation,
    required TResult Function(bool value, void Function(bool) onValueChanged)
        switcher,
  }) {
    return navigation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? navigation,
    TResult? Function(bool value, void Function(bool) onValueChanged)? switcher,
  }) {
    return navigation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigation,
    TResult Function(bool value, void Function(bool) onValueChanged)? switcher,
    required TResult orElse(),
  }) {
    if (navigation != null) {
      return navigation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArrowRight value) navigation,
    required TResult Function(Switcher value) switcher,
  }) {
    return navigation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArrowRight value)? navigation,
    TResult? Function(Switcher value)? switcher,
  }) {
    return navigation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArrowRight value)? navigation,
    TResult Function(Switcher value)? switcher,
    required TResult orElse(),
  }) {
    if (navigation != null) {
      return navigation(this);
    }
    return orElse();
  }
}

abstract class ArrowRight implements ListItemTrailingType {
  const factory ArrowRight() = _$ArrowRight;
}

/// @nodoc
abstract class _$$SwitcherCopyWith<$Res> {
  factory _$$SwitcherCopyWith(
          _$Switcher value, $Res Function(_$Switcher) then) =
      __$$SwitcherCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value, void Function(bool) onValueChanged});
}

/// @nodoc
class __$$SwitcherCopyWithImpl<$Res>
    extends _$ListItemTrailingTypeCopyWithImpl<$Res, _$Switcher>
    implements _$$SwitcherCopyWith<$Res> {
  __$$SwitcherCopyWithImpl(_$Switcher _value, $Res Function(_$Switcher) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? onValueChanged = null,
  }) {
    return _then(_$Switcher(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      null == onValueChanged
          ? _value.onValueChanged
          : onValueChanged // ignore: cast_nullable_to_non_nullable
              as void Function(bool),
    ));
  }
}

/// @nodoc

class _$Switcher implements Switcher {
  const _$Switcher(this.value, this.onValueChanged);

  @override
  final bool value;
  @override
  final void Function(bool) onValueChanged;

  @override
  String toString() {
    return 'ListItemTrailingType.switcher(value: $value, onValueChanged: $onValueChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Switcher &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.onValueChanged, onValueChanged) ||
                other.onValueChanged == onValueChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, onValueChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitcherCopyWith<_$Switcher> get copyWith =>
      __$$SwitcherCopyWithImpl<_$Switcher>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigation,
    required TResult Function(bool value, void Function(bool) onValueChanged)
        switcher,
  }) {
    return switcher(value, onValueChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? navigation,
    TResult? Function(bool value, void Function(bool) onValueChanged)? switcher,
  }) {
    return switcher?.call(value, onValueChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigation,
    TResult Function(bool value, void Function(bool) onValueChanged)? switcher,
    required TResult orElse(),
  }) {
    if (switcher != null) {
      return switcher(value, onValueChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArrowRight value) navigation,
    required TResult Function(Switcher value) switcher,
  }) {
    return switcher(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArrowRight value)? navigation,
    TResult? Function(Switcher value)? switcher,
  }) {
    return switcher?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArrowRight value)? navigation,
    TResult Function(Switcher value)? switcher,
    required TResult orElse(),
  }) {
    if (switcher != null) {
      return switcher(this);
    }
    return orElse();
  }
}

abstract class Switcher implements ListItemTrailingType {
  const factory Switcher(
      final bool value, final void Function(bool) onValueChanged) = _$Switcher;

  bool get value;
  void Function(bool) get onValueChanged;
  @JsonKey(ignore: true)
  _$$SwitcherCopyWith<_$Switcher> get copyWith =>
      throw _privateConstructorUsedError;
}
