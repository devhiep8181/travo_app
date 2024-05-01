abstract class ActionReactRemoteDataSoure {
  Future<bool?> getValueReact({required String uid, required String email});

  Future<void> pushValueReact(
      {required String uid, required String email, required bool? valueReact});

  Future<void> deleteValueReact({required String uid, required String email});

  Future<void> updateValueReact(
      {required String uid, required String email, required bool? valueReact});
}
