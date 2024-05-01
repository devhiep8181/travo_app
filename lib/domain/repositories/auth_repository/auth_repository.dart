// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> verifyUser(String email, String password);
}
