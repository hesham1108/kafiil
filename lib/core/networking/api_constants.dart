class ApiConstants {
  static const String apiBaseUrl = 'https://e-commerce.kafiil.com/api/';

  static const String login = '${apiBaseUrl}token';
  static const String getCategories = '${apiBaseUrl}categories';
  static const String getProducts = '${apiBaseUrl}products';
  static const String signup = '${apiBaseUrl}customers';
  static const String userTypes = '${apiBaseUrl}userTypes';
  static const String getCart = 'shopping_cart_items';

  static const String tokenKey = 'tokenKey';
  static const String customerId = 'customerId';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "no InternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
