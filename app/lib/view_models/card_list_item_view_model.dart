import 'text_deliminator.dart';
import 'view_model.dart';

class CardListItemViewModel<ID> extends ViewModel<ID> {
  final String upperText;
  final TextDeliminator? textDeliminator;
  final String bottomText;

  CardListItemViewModel(
    super.id, {
    required this.upperText,
    required this.bottomText,
    this.textDeliminator,
  });
}
