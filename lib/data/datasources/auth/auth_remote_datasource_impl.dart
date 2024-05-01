// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../../../configs/cache/auth_cache_manager.dart';
import '../../../core/data/base_remote_datasource.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;
  @override
  Future<User> getUser(String email, String password) async {
    final user = await baseRemoteDatasource.signInUserWithEmail(
        email: email, password: password) as User;
    await AuthCacheManager.updateUid(user.uid);
    await AuthCacheManager.updateLoggeIn(true);
    Logger().i(user);
    return user;
  }
}
