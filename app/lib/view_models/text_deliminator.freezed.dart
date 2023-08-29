// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_deliminator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextDeliminator {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) simpleText,
    required TResult Function(String? additionalInfo) arrowDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? simpleText,
    TResult? Function(String? additionalInfo)? arrowDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? simpleText,
    TResult Function(String? additionalInfo)? arrowDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleText value) simpleText,
    required TResult Function(ArrowDown value) arrowDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleText value)? simpleText,
    TResult? Function(ArrowDown value)? arrowDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleText value)? simpleText,
    TResult Function(ArrowDown value)? arrowDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDeliminatorCopyWith<$Res> {
  factory $TextDeliminatorCopyWith(
          TextDeliminator value, $Res Function(TextDeliminator) then) =
      _$TextDeliminatorCopyWithImpl<$Res, TextDeliminator>;
}

/// @nodoc
class _$TextDeliminatorCopyWithImpl<$Res, $Val extends TextDeliminator>
    implements $TextDeliminatorCopyWith<$Res> {
  _$TextDeliminatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SimpleTextCopyWith<$Res> {
  factory _$$SimpleTextCopyWith(
          _$SimpleText value, $Res Function(_$SimpleText) then) =
      __$$SimpleTextCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SimpleTextCopyWithImpl<$Res>
    extends _$TextDeliminatorCopyWithImpl<$Res, _$SimpleText>
    implements _$$SimpleTextCopyWith<$Res> {
  __$$SimpleTextCopyWithImpl(
      _$SimpleText _value, $Res Function(_$SimpleText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SimpleText(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SimpleText implements SimpleText {
  const _$SimpleText(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TextDeliminator.simpleText(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleText &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTextCopyWith<_$SimpleText> get copyWith =>
      __$$SimpleTextCopyWithImpl<_$SimpleText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) simpleText,
    required TResult Function(String? additionalInfo) arrowDown,
  }) {
    return simpleText(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? simpleText,
    TResult? Function(String? additionalInfo)? arrowDown,
  }) {
    return simpleText?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? simpleText,
    TResult Function(String? additionalInfo)? arrowDown,
    required TResult orElse(),
  }) {
    if (simpleText != null) {
      return simpleText(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleText value) simpleText,
    required TResult Function(ArrowDown value) arrowDown,
  }) {
    return simpleText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleText value)? simpleText,
    TResult? Function(ArrowDown value)? arrowDown,
  }) {
    return simpleText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleText value)? simpleText,
    TResult Function(ArrowDown value)? arrowDown,
    required TResult orElse(),
  }) {
    if (simpleText != null) {
      return simpleText(this);
    }
    return orElse();
  }
}

abstract class SimpleText implements TextDeliminator {
  const factory SimpleText(final String text) = _$SimpleText;

  String get text;
  @JsonKey(ignore: true)
  _$$SimpleTextCopyWith<_$SimpleText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArrowDownCopyWith<$Res> {
  factory _$$ArrowDownCopyWith(
          _$ArrowDown value, $Res Function(_$ArrowDown) then) =
      __$$ArrowDownCopyWithImpl<$Res>;
  @useResult
  $Res call({String? additionalInfo});
}

/// @nodoc
class __$$ArrowDownCopyWithImpl<$Res>
    extends _$TextDeliminatorCopyWithImpl<$Res, _$ArrowDown>
    implements _$$ArrowDownCopyWith<$Res> {
  __$$ArrowDownCopyWithImpl(
      _$ArrowDown _value, $Res Function(_$ArrowDown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalInfo = freezed,
  }) {
    return _then(_$ArrowDown(
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ArrowDown implements ArrowDown {
  const _$ArrowDown({this.additionalInfo});

  @override
  final String? additionalInfo;

  @override
  String toString() {
    return 'TextDeliminator.arrowDown(additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArrowDown &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, additionalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArrowDownCopyWith<_$ArrowDown> get copyWith =>
      __$$ArrowDownCopyWithImpl<_$ArrowDown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) simpleText,
    required TResult Function(String? additionalInfo) arrowDown,
  }) {
    return arrowDown(additionalInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? simpleText,
    TResult? Function(String? additionalInfo)? arrowDown,
  }) {
    return arrowDown?.call(additionalInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? simpleText,
    TResult Function(String? additionalInfo)? arrowDown,
    required TResult orElse(),
  }) {
    if (arrowDown != null) {
      return arrowDown(additionalInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleText value) simpleText,
    required TResult Function(ArrowDown value) arrowDown,
  }) {
    return arrowDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SimpleText value)? simpleText,
    TResult? Function(ArrowDown value)? arrowDown,
  }) {
    return arrowDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleText value)? simpleText,
    TResult Function(ArrowDown value)? arrowDown,
    required TResult orElse(),
  }) {
    if (arrowDown != null) {
      return arrowDown(this);
    }
    return orElse();
  }
}

abstract class ArrowDown implements TextDeliminator {
  const factory ArrowDown({final String? additionalInfo}) = _$ArrowDown;

  String? get additionalInfo;
  @JsonKey(ignore: true)
  _$$ArrowDownCopyWith<_$ArrowDown> get copyWith =>
      throw _privateConstructorUsedError;
}
