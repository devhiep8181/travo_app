import '../../../configs/cache/user_singleton.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/user_model.dart';
import 'get_user_remote_datasource.dart';

class GetUserRemoteDatasourceImpl implements GetUserRemoteDatasource {
  GetUserRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<UserModel> getUser({required String email}) async {
    final userFromFireBase = await baseRemoteDatasource.getUser(email: email);

    final userModel =
        UserModel.fromMap(userFromFireBase as Map<String, dynamic>);

    UserSingleton().login(
        email: userModel.email,
        name: userModel.displayName ?? '',
        phoneNumber: userModel.phoneNumber ?? '',
        country: userModel.countryName ?? '');
  
    return userModel;
  }
}
