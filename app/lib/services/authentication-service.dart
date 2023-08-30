import 'dart:io';

import 'package:areweeven/env/env.dart';
import 'package:awe_api/awe_api.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OauthService {
  final LoginType _type;

  OauthService(
    this._type,
  );

  Future<String?> getIdToken() async {
    switch (_type) {
      case LoginType.google:
        final googleSigIn = GoogleSignIn(
          // TODO: make env
          clientId: Platform.isAndroid
              ? Env.androidGoogleClientId
              : Env.iOSGoogleClientId,
          scopes: [
            "email",
            "profile",
          ],
        );
        final result = await googleSigIn.signIn();
        final auth = await result?.authentication;
        return auth?.idToken;
    }
  }
}
