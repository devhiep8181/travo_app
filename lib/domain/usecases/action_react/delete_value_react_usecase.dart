import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/action_react_repository.dart';
import 'get_value_react_usecase.dart';

class DeleteValueReactUseCase implements UseCase<void, ValueReactParamas> {
  DeleteValueReactUseCase({
    required this.actionReactRepository,
  });
  final ActionReactRepository actionReactRepository;

  @override
  Future<Either<Failure, void>> call(ValueReactParamas params) async {
    return actionReactRepository.deleteValueReactWithEmail(
        uid: params.uid, email: params.email);
  }
}
