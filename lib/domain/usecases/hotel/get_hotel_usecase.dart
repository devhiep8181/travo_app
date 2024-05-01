import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/hotel_entity.dart';
import '../../repositories/hotel_repository/hotel_reposiory.dart';

class GetHotelUsecase implements UseCase<List<HotelEntity>, NoParams> {
  GetHotelUsecase({
    required this.hotelRepository,
  });
  final HotelRepository hotelRepository;

  @override
  Future<Either<Failure, List<HotelEntity>>> call(NoParams params) async {
    return hotelRepository.getHotel();
  }
}
