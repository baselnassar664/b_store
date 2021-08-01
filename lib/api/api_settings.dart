mixin ApiSettings {
  static const String _BASE_URL = 'https://smart-store.mr-dev.tech';
  static const String _API_BASE_URL = _BASE_URL+'/api/';


  static const String LOGIN = _API_BASE_URL + "auth/login";
  static const String REGISTER = _API_BASE_URL + "auth/login";
  static const String LOGOUT = _API_BASE_URL + "auth/logout";
  static const String FORGET_PASSWORD = _API_BASE_URL + "auth/forget-password";
  static const String RESET_PASSWORD = _API_BASE_URL + "auth/reset-password";
  static const String ACTIVATE = _API_BASE_URL + "auth/activate";


}
