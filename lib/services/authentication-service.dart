
import 'package:auth0_flutter/auth0_flutter.dart';

abstract class AuthenticationService<T> {
  Auth0 auth0 = Auth0(
    'nahit-fidanci.eu.auth0.com', //auth0 domain
    'AUTH0_CLIENT_ID',
  );

  Future<T> signIn();

  Future<void> signOut();
}