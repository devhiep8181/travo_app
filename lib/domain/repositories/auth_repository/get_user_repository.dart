import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/user_entity.dart';

abstract class GetUserRepository {
  Future<Either<Failure, UserEnity>> getUser({required String email});
}
