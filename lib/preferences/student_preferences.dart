
import 'package:b_store/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentPreferences {
  static final StudentPreferences _instance = StudentPreferences._();
  late final SharedPreferences _sharedPreferences;

  factory StudentPreferences() {
    return _instance;
  }

  StudentPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save(Student student) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setBool('active', student.active);
    await _sharedPreferences.setBool('verified', student.verified);
    await _sharedPreferences.setInt('city_id', student.cityId);
    await _sharedPreferences.setInt('id', student.id);
    await _sharedPreferences.setInt('store_id', student.storeId);
    await _sharedPreferences.setString('mobile', student.mobile);
    await _sharedPreferences.setString('name', student.name);
    await _sharedPreferences.setString('gender', student.gender);
    await _sharedPreferences.setString('token', "Bearer ${student.token}");
  }

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  String get token => _sharedPreferences.getString('token') ?? '';

  Student get student {
    Student student = Student();
    student.id = _sharedPreferences.getInt('id') ?? 0;
     student.name=_sharedPreferences.getString('name') ?? '';
    student.mobile=_sharedPreferences.getString('mobile')?? '';
    student.gender = _sharedPreferences.getString('gender') ?? '';
    student.storeId=_sharedPreferences.getInt('store_id')?? 0;
    student.cityId=_sharedPreferences.getInt('city_id')?? 0;
    student.active = _sharedPreferences.getBool('active') ?? false;
    student.token = _sharedPreferences.getString('token') ?? '';
    student.verified = _sharedPreferences.getBool('verified') ?? false;
    return student;
  }
  Future<bool> setLanguage(String languageCode) async {
    return await _sharedPreferences.setString('language_code', languageCode);
  }
  String get languageCode => _sharedPreferences.getString('language_code') ?? 'en';
  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }

}
