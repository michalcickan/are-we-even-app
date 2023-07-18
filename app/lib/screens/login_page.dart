import 'package:areweeven/services/authentication-service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // void navigateToUserProfile(Credentials credentials) {
  void navigateToUserProfile() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProfilePage(
    //       credentials: credentials,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     SignInWithApple signInWithApple = SignInWithApple();
            //
            //     final credentials = await signInWithApple.signIn();
            //     navigateToUserProfile(credentials);
            //   },
            //   child: const Text('Sign in with Apple'),
            // ),
            ...LoginType.values
                .map(
                  (type) => ElevatedButton(
                    onPressed: () async {
                      try {
                        final client = OauthService(type);
                        final token = await client.getIdToken();
                        final result = await _performLogin(token!);
                        print(result);
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                    child: Text(
                      type.toString(),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> _performLogin(String accessToken) async {
  final dio = Dio();

  try {
    final response = await dio.post('http://localhost:8080/login', data: {
      'idToken': accessToken,
      'loginType': 'GOOGLE', // Replace with the desired login type
    });
    return response.data;
  } catch (e) {
    // Error occurred during the request
    print('Request error: $e');
  }
}
