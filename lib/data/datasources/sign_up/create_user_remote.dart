import '../../models/user_model.dart';

abstract class CreateUserRemote {
  Future<void> createUser(UserModel userModel);
}
