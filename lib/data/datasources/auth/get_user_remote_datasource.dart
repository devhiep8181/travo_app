import '../../models/user_model.dart';

abstract class GetUserRemoteDatasource {
  Future<UserModel> getUser({required String email});
}
