// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'IOS_GOOGLE_CLIENT_ID')
  static const String iOSGoogleClientId = _Env.iOSGoogleClientId;
  @EnviedField(varName: 'ANDROID_GOOGLE_CLIENT_ID')
  static const String androidGoogleClientId = _Env.androidGoogleClientId;

  @EnviedField(varName: 'API_HOST')
  static const String apiHost = _Env.apiHost;
}
