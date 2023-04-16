abstract class ApiInterceptor {
  void onRequest(ApiRequestData data) {
    data.onRequestNext?.call(data, false);
  }

  void onResponse(ApiResponseData data) {
    data.onResponseNext?.call(data, null);
  }

  void onError(ApiError error) {
    error.onErrorNext?.call(error, null);
  }
}

typedef OnRequestNext = void Function(ApiRequestData, bool);

class ApiRequestData {
  String path;
  Map<String, dynamic>? queryParameters;
  Map<String, dynamic>? data;
  Map<String, dynamic>? header;
  OnRequestNext? onRequestNext;
  String method;
  String baseUrl;

  ApiRequestData({
    required this.path,
    required this.method,
    required this.baseUrl,
    this.onRequestNext,
    this.queryParameters,
    this.data,
    this.header,
  });
}

typedef OnResponseNext = void Function(ApiResponseData?, ApiError? error);

class ApiResponseData {
  ApiRequestData requestData;
  dynamic data;
  int statusCode;
  OnResponseNext? onResponseNext;

  ApiResponseData({
    required this.requestData,
    required this.statusCode,
    this.onResponseNext,
    this.data,
  });
}

typedef OnErrorNext = void Function(ApiError? error, ApiResponseData? response);

class ApiError {
  ApiRequestData requestData;
  dynamic error;
  int statusCode;
  OnErrorNext? onErrorNext;
  ApiResponseData? responseData;

  ApiError({
    required this.requestData,
    required this.statusCode,
    this.error,
    this.onErrorNext,
    this.responseData,
  });
}
