import 'package:dio/dio.dart';

abstract class NetworkResponseConfig {
  NetworkResponseConfig();
}

class NetworkSuccesResponse<N> extends NetworkResponseConfig {
  N model;
  NetworkSuccesResponse(this.model);
}

class NetworkErrorResponse extends NetworkResponseConfig {
  String error = '';
  NetworkErrorResponse(this.error);
}

class NetworkExeptionResponse extends NetworkResponseConfig {
  DioException exception;
  String messageForUser = '';
  NetworkExeptionResponse(this.exception) {
    if (exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.unknown) {
      messageForUser = 'Iltimos Internetingini tekshiring';
    } else {
      messageForUser = exception.message.toString();
    }
  }
}
