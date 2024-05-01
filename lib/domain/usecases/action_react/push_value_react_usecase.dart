import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/action_react_repository.dart';

class PushValueReactUseCase implements UseCase<void, PushValueReactParams> {
  PushValueReactUseCase({
    required this.actionReactRepository,
  });
  final ActionReactRepository actionReactRepository;

  @override
  Future<Either<Failure, void>> call(PushValueReactParams params) async {
    return actionReactRepository.pushValueReactWithEmail(
        uid: params.uid, email: params.email, reactValue: params.valueReact);
  }
}

class PushValueReactParams extends Equatable {
  const PushValueReactParams({
    required this.uid,
    required this.email,
    required this.valueReact,
  });
  final String uid;
  final String email;
  final bool? valueReact;

  @override
  List<Object?> get props => [uid, email, valueReact];
}
