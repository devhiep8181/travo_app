import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/user_entity.dart';

abstract class CreateUserRepository {
  Future<Either<Failure, void>> creatUser(UserEnity userEnity);
}
