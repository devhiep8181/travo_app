import '../../../core/data/base_remote_datasource.dart';
import '../../models/user_model.dart';
import 'create_user_remote.dart';

class CreateUserRemoteImpl implements CreateUserRemote {
  CreateUserRemoteImpl({
    required this.baseRemoteDatasource,
  });
  BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<void> createUser(UserModel userModel) async {
      return baseRemoteDatasource.createUserWithEmail(
          email: userModel.email,
          password: userModel.password ?? '',
          name: userModel.displayName ?? '',
          countryName: userModel.countryName ?? '',
          phoneNumber: userModel.phoneNumber ?? '',
          image:  userModel.image ?? '',
          );
    }
  }

