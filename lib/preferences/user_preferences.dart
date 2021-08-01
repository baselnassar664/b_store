
import 'package:b_store/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  late final SharedPreferences _sharedPreferences;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save(User user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('full_name', user.fullName);
    await _sharedPreferences.setString('city', user.city);
    await _sharedPreferences.setString('phone', user.phone);
    await _sharedPreferences.setString('gender', user.gender);
    await _sharedPreferences.setString('token', "Bearer ${user.token}");
  }

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  String get token => _sharedPreferences.getString('token') ?? '';

 User get user {
   User user = User();
   user.id = _sharedPreferences.getInt('id') ?? 0;
   user.fullName = _sharedPreferences.getString('city') ?? '';
   user.fullName = _sharedPreferences.getString('full_name') ?? '';
   user.phone = _sharedPreferences.getString('phone ') ?? '';
   user.gender = _sharedPreferences.getString('gender') ?? '';
    return user;
  }

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
