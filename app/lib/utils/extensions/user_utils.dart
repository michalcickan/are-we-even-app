import 'package:awe_api/awe_api.dart';

extension Utils on User {
  String get validName => name ?? email;
}
