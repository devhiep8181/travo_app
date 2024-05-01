class UserSingleton {
  //b3: phương thức tạo đối tượng
  factory UserSingleton() {
    return _instance;
  }
  //b1: tạo hàm tạo riêng tư
  UserSingleton._internal();

  //b2 biến tĩnh chứa đối tượng duy nhất
  static final UserSingleton _instance = UserSingleton._internal();

  String _email = '';
  String _name = '';
  String _phoneNumber = '';
  String _country = '';
  

  String get email => _email;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get country => _country;
 

  void login({
    required String email,
    required String name,
    required String phoneNumber,
    required String country,

  }) {
    _email = email;
    _name = name;
    _phoneNumber = phoneNumber;
    _country = country;

  }
}
