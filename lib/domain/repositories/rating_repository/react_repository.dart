import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';

abstract class ReactRepository {
  Future<Either<Failure, void>> updateReact({
    required String uid,
    required int like,
    required int dislike,
  });
}
