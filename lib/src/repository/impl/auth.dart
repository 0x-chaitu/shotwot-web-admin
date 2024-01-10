import 'dart:convert';
import 'dart:developer';

import 'package:admin/src/repository/i_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuth)
class AuthFacade implements IAuth {
 
  final  FirebaseAuth _firebaseAuth;

  Client client = Client();

  AuthFacade(this._firebaseAuth);


  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());

      final User? user = userCredential.user;

      return _getJwt(user, "signin");
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    return false;
  }

  @override
  Future<void> logOut() async {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseAuth.signOut();
    }
  }

  Future<bool> _getJwt(User? user, String path) async {
    final Response response;
    if (user != null) {
      Uri uri = Uri(
        host: "localhost",
        path: "/api/v1/admin/$path",
        scheme: "http",
        port: 8000,
      );
      try {
        response = await client.post(uri,
            body: json.encode({"idToken": await user.getIdToken()}));
        if (response.statusCode == 200) {
          // Tokens tokens = Tokens.fromJson(json.decode(response.body));
          // Token token = Token();
          // Map<String, String> tokenList = tokens.tokens;
          // token.accessToken = tokenList["accesstoken"];
          // token.id = 1;
          // if (token.accessToken != null) {
          //   _authService.setUserToken(token);
          //   return true;
          // }
          return true;
        } else {
          throw Exception(response);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return false;
  }

  // User? _setJwtAReturnUser(User? user) {
  //   if (user != null) {
  //     Token token = Token();
  //     token.accessToken = user.uid;
  //     token.id = 1;
  //     _authService.setUserToken(token);
  //     return user;
  //   }
  //   return null;
  // }
}