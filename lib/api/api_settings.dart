mixin ApiSettings {
  static const String _BASE_URL = 'https://smart-store.mr-dev.tech';
  static const String _API_BASE_URL = _BASE_URL+'/api/';


  static const String LOGIN = _API_BASE_URL + "auth/login";
  static const String REGISTER = _API_BASE_URL + "auth/register";
  static const String LOGOUT = _API_BASE_URL + "auth/logout";
  static const String FORGET_PASSWORD = _API_BASE_URL + "auth/forget-password";
  static const String RESET_PASSWORD = _API_BASE_URL + "auth/reset-password";
  static const String ACTIVATE = _API_BASE_URL + "auth/activate";
  static const String GET_CATEGORIES = _API_BASE_URL + "categories";
  static const String refresh_fcm_token = _BASE_URL + "/auth/refresh-fcm-token";
  static const String POST_CONTACT = _API_BASE_URL + "contact-requests";
  static const String POST_CHANGE_PASSWORD = _API_BASE_URL + "auth/change-password";
  static const String GET_CITIES = _API_BASE_URL + "cities";
  static const String POST_PROFILE = _API_BASE_URL + "auth/update-profile";

  static const String GET_ADDRESS = _API_BASE_URL + "addresses";

  static const String GET_PRODUCT= _API_BASE_URL + "sub-categories";
  static const String GET_PRODUCT_DETAILS= _API_BASE_URL + "products";

  static const String GET_Favorite= _API_BASE_URL + "favorite-products";

  static const String GET_HOME= _API_BASE_URL + "home";

  static const String POST_RATE= _API_BASE_URL + "products/rate";
  //card
  static const String CARD = _API_BASE_URL + "payment-cards";

  //order
  static const String ORDER =  _API_BASE_URL + "orders";

}
