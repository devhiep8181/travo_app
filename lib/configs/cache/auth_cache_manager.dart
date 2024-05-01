//TODO: enum => file?

// Dart imports:
import 'dart:developer';

// Project imports:
import 'app_cache.dart';

enum NetworkEnums {
  login('login'),
  introOff('introOff'),
  uid('uid');

  const NetworkEnums(this.path);
  final String path;
}

class AuthCacheManager {
  //KIỂM TRA CÓ PHẢI ĐÂY LÀ LẦN ĐĂNG NHẬP ĐẦU TIÊN KHÔNG => chuyển vào màn Onboarding
  //nếu không có giá trị thì mặc định bằng true => lần đăng nhập đầu tiên
  //gọi update trả về false
  //tí gọi ra ở đây thì mới vào màn login được
  static Future<bool> isFirstEntry() async {
    return await AppCache.getBool(NetworkEnums.introOff.path) ?? true;
  }

//nếu chưa đăng nhập => false
  static Future<bool> isLoggedIn() async {
    return await AppCache.getBool(NetworkEnums.login.path) ?? false;
  }

  //logout thì xoá key lưu giá trị đăng nhập đi
  //muốn test màn onboarding thì xoá hết cache đi là được
  //tưởng tưởng ở đây cần 2 cái công tắc
  //1 công tắc để bật tắt vào màn home và login => giá trị lưu trong updateLoggin()
  //1 công tắc để bật tắt vào mà oboadring => giá trị lưu trong updateFirstyEntry()
  static Future<void> signOut() async {
    log('call signOut');
    //await AppCache.clearAll();
    await AppCache.remove(NetworkEnums.login.path);
  }

//từ từ chỗ này cấn cấn
//update tức là ghi cái lần đăng nhập này vào với key: value
//là introOff: true => tý gọi ra thì trả về true => auto vào màn onboarding à
  static Future<void> updateFirstEntry() async {
    await AppCache.setBool(NetworkEnums.introOff.path, false);
  }

  static Future<void> updateLoggeIn(bool isLoggeedIn) async {
    await AppCache.setBool(NetworkEnums.login.path, isLoggeedIn);
  }

  static Future<void> removeLogout(String key) async {
    await AppCache.remove(key);
  }

  //TODO: !
  static Future<void> updateUid(String? uid) async {
    if (uid != null) {
      await AppCache.setString(NetworkEnums.uid.path, uid);
    } else {
      if (await AppCache.containsKey(NetworkEnums.uid.path)) {
        await AppCache.remove(NetworkEnums.uid.path);
      }
    }
  }

  static Future<void> updateUidStorage() async {
    if (await AppCache.containsKey(NetworkEnums.uid.path)) {
      await AppCache.getString(NetworkEnums.uid.path);
    }
  }
}
