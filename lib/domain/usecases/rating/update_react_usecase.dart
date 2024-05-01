import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/react_repository.dart';

class UpdateReactUseCase implements UseCase<void, ReactPramas> {
  UpdateReactUseCase({
    required this.reactRepository,
  });
  final ReactRepository reactRepository;

  @override
  Future<Either<Failure, void>> call(ReactPramas params) async {
    return reactRepository.updateReact(
        uid: params.uid ?? '',
        like: params.like ?? 0,
        dislike: params.dislike ?? 0,
        );
  }
}

class ReactPramas extends Equatable {
  const ReactPramas({
    required this.uid,
    required this.like,
    required this.dislike,
  });
  final String? uid;
  final int? like;
  final int? dislike;

  @override
  List<Object?> get props => [uid, like, dislike];
}
