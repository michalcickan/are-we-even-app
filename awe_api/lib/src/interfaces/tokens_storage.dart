

class TokensHolder {
  String? accessToken;
  String? refreshToken;

  TokensHolder(
    this.accessToken,
    this.refreshToken,
  );
}

abstract class TokensStorage {
  Future<TokensHolder> getTokens();

  void saveRefreshToken(String? refreshToken);

  void saveAccessToken(String? accessToken);
}
