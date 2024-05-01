import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/action_react_repository.dart';

class GetValueReactUseCase implements UseCase<bool?, ValueReactParamas> {
  GetValueReactUseCase({
    required this.actionReactRepository,
  });
  final ActionReactRepository actionReactRepository;

  @override
  Future<Either<Failure, bool?>> call(ValueReactParamas params) async {
    return actionReactRepository.getValueReactWithEmail(
        uid: params.uid, email: params.email);
  }
}

class ValueReactParamas extends Equatable {
  const ValueReactParamas({
    required this.uid,
    required this.email,
  });
  final String uid;
  final String email;

  @override
  List<Object?> get props => [uid, email];
}
