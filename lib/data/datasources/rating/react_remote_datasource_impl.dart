import '../../../core/data/base_remote_datasource.dart';
import 'react_remote_datasoure.dart';

class ReactRemoteDatasourceImpl implements ReactRemoteDatasource {
  ReactRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<void> updateReactReviewHotel(
      {required String uid,
      required int like,
      required int dislike,
     }) async {
    await baseRemoteDatasource.updateReactReviewHotel(
        uid: uid, like: like, dislike: dislike);
  }
}
