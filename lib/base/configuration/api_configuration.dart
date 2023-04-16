import 'package:herculas_bluetooth_connectivity/base/configuration/api_interceptors.dart';

class ApiConfigurations {
  final String baseUrl;
  LogConfigurations? _logConfigurations;
  TimeOutConfigurations timeOutConfigurations;
  String contentType;
  List<ApiInterceptor>? interceptors;

  ApiConfigurations({
    required this.baseUrl,
    LogConfigurations? logConfigurations,
    this.timeOutConfigurations = const TimeOutConfigurations(),
    this.contentType = 'application/json',
    this.interceptors,
  }) {
    _logConfigurations = logConfigurations;
  }

  LogConfigurations get logConfigurations => _logConfigurations ?? LogConfigurations.none();
}

class LogConfigurations {
  final bool logHeader;
  final bool logRequestBody;
  final bool logResponseBody;

  const LogConfigurations({
    required this.logHeader,
    required this.logRequestBody,
    required this.logResponseBody,
  });

  factory LogConfigurations.none() => const LogConfigurations(
        logHeader: false,
        logRequestBody: false,
        logResponseBody: false,
      );
}

class TimeOutConfigurations {
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  const TimeOutConfigurations({
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.sendTimeout = const Duration(seconds: 30),
  });
}
