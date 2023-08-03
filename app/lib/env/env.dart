// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_CLIENT_ID')
  static const String googleClientId = _Env.googleClientId;

  @EnviedField(varName: 'API_HOST')
  static const String apiHost = _Env.googleClientId;
}
