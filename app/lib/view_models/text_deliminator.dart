import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_deliminator.freezed.dart';

@freezed
class TextDeliminator with _$TextDeliminator {
  const factory TextDeliminator.simpleText(
    String text,
  ) = SimpleText;

  const factory TextDeliminator.arrowDown({String? additionalInfo}) = ArrowDown;
}
