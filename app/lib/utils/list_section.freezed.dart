// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SectionRightItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String text, void Function() onPressed) more,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String text, void Function() onPressed)? more,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String text, void Function() onPressed)? more,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SectionRightItem value) $default, {
    required TResult Function(More value) more,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SectionRightItem value)? $default, {
    TResult? Function(More value)? more,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SectionRightItem value)? $default, {
    TResult Function(More value)? more,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionRightItemCopyWith<$Res> {
  factory $SectionRightItemCopyWith(
          SectionRightItem value, $Res Function(SectionRightItem) then) =
      _$SectionRightItemCopyWithImpl<$Res, SectionRightItem>;
}

/// @nodoc
class _$SectionRightItemCopyWithImpl<$Res, $Val extends SectionRightItem>
    implements $SectionRightItemCopyWith<$Res> {
  _$SectionRightItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SectionRightItemCopyWith<$Res> {
  factory _$$_SectionRightItemCopyWith(
          _$_SectionRightItem value, $Res Function(_$_SectionRightItem) then) =
      __$$_SectionRightItemCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SectionRightItemCopyWithImpl<$Res>
    extends _$SectionRightItemCopyWithImpl<$Res, _$_SectionRightItem>
    implements _$$_SectionRightItemCopyWith<$Res> {
  __$$_SectionRightItemCopyWithImpl(
      _$_SectionRightItem _value, $Res Function(_$_SectionRightItem) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SectionRightItem implements _SectionRightItem {
  const _$_SectionRightItem();

  @override
  String toString() {
    return 'SectionRightItem()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SectionRightItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String text, void Function() onPressed) more,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String text, void Function() onPressed)? more,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String text, void Function() onPressed)? more,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SectionRightItem value) $default, {
    required TResult Function(More value) more,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SectionRightItem value)? $default, {
    TResult? Function(More value)? more,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SectionRightItem value)? $default, {
    TResult Function(More value)? more,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _SectionRightItem implements SectionRightItem {
  const factory _SectionRightItem() = _$_SectionRightItem;
}

/// @nodoc
abstract class _$$MoreCopyWith<$Res> {
  factory _$$MoreCopyWith(_$More value, $Res Function(_$More) then) =
      __$$MoreCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, void Function() onPressed});
}

/// @nodoc
class __$$MoreCopyWithImpl<$Res>
    extends _$SectionRightItemCopyWithImpl<$Res, _$More>
    implements _$$MoreCopyWith<$Res> {
  __$$MoreCopyWithImpl(_$More _value, $Res Function(_$More) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? onPressed = null,
  }) {
    return _then(_$More(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$More implements More {
  const _$More(this.text, this.onPressed);

  @override
  final String text;
  @override
  final void Function() onPressed;

  @override
  String toString() {
    return 'SectionRightItem.more(text: $text, onPressed: $onPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$More &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, onPressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreCopyWith<_$More> get copyWith =>
      __$$MoreCopyWithImpl<_$More>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String text, void Function() onPressed) more,
  }) {
    return more(text, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String text, void Function() onPressed)? more,
  }) {
    return more?.call(text, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String text, void Function() onPressed)? more,
    required TResult orElse(),
  }) {
    if (more != null) {
      return more(text, onPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SectionRightItem value) $default, {
    required TResult Function(More value) more,
  }) {
    return more(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SectionRightItem value)? $default, {
    TResult? Function(More value)? more,
  }) {
    return more?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SectionRightItem value)? $default, {
    TResult Function(More value)? more,
    required TResult orElse(),
  }) {
    if (more != null) {
      return more(this);
    }
    return orElse();
  }
}

abstract class More implements SectionRightItem {
  const factory More(final String text, final void Function() onPressed) =
      _$More;

  String get text;
  void Function() get onPressed;
  @JsonKey(ignore: true)
  _$$MoreCopyWith<_$More> get copyWith => throw _privateConstructorUsedError;
}
