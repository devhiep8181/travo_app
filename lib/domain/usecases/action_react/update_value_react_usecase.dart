import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/action_react_repository.dart';
import 'push_value_react_usecase.dart';

class UpdateValueReactUseCase implements UseCase<void, PushValueReactParams> {
  UpdateValueReactUseCase({
    required this.actionReactRepository,
  });
  final ActionReactRepository actionReactRepository;

  @override
  Future<Either<Failure, void>> call(PushValueReactParams params) async {
    return actionReactRepository.updateValueReactWithEmail(
        uid: params.uid, email: params.email, valueReact: params.valueReact);
  }
}
