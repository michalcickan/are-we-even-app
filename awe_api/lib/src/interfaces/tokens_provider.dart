import 'package:awe_api/src/tokens_holder.dart';

abstract class TokensProvider {
  Future<TokensHolder> getTokens();

  void saveRefreshToken(String? refreshToken);

  void saveAccessToken(String? accessToken);
}
