// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<User> getUser(String email, String password);
}


