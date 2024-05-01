import '../../../core/data/base_remote_datasource.dart';
import 'action_react_remote_datasource.dart';

class ActionReactRemoteDatasoureImpl implements ActionReactRemoteDataSoure {
  ActionReactRemoteDatasoureImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<void> deleteValueReact(
      {required String uid, required String email}) async {
    await baseRemoteDatasource.deleteReact(email: email, uid: uid);
  }

  @override
  Future<bool?> getValueReact(
      {required String uid, required String email}) async {
    final result = await baseRemoteDatasource.getValueReactReviewHotel(
        email: email, uid: uid);
    return result;
  }

  @override
  Future<void> pushValueReact(
      {required String uid,
      required String email,
      required bool? valueReact}) async {
    await baseRemoteDatasource.addReactReviewHotel(
        email: email, uid: uid, valueReact: valueReact);
  }

  @override
  Future<void> updateValueReact(
      {required String uid,
      required String email,
      required bool? valueReact}) async {
    await baseRemoteDatasource.updateValueReactReviewHotel(
        email: email, uid: uid, valueReact: valueReact);
  }
}
