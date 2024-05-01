import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';

abstract class ActionReactRepository {
  Future<Either<Failure, bool?>> getValueReactWithEmail(
      {required String uid, required String email});

  Future<Either<Failure, void>> updateValueReactWithEmail(
      {required String uid, required String email, required bool? valueReact});

  Future<Either<Failure, void>> pushValueReactWithEmail(
      {required String uid, required String email, required bool? reactValue});

  Future<Either<Failure, void>> deleteValueReactWithEmail(
      {required String uid, required String email});
}
