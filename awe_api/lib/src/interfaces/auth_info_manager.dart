class TokensHolder {
  String? accessToken;
  String? refreshToken;

  TokensHolder(
    this.accessToken,
    this.refreshToken,
  );
}

abstract class AuthInfoManager {
  Future<TokensHolder> getTokens();

  Future<String> get deviceId;

  void saveRefreshToken(String? refreshToken);

  void saveAccessToken(String? accessToken);
}
