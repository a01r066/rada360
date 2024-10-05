import 'package:dio/dio.dart';
import 'package:rada360/gen/localization/l10n.dart';

class MyDioException implements Exception {
  String message = "";
  String? error;
  String? errorCode;
  int? statusCode;

  MyDioException(
    this.message, {
    this.errorCode,
    this.statusCode,
    this.error,
  });

  MyDioException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        statusCode = dioError.response?.statusCode;
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if ((dioError.message ?? "").contains("SocketException")) {
          message = S.current.error_no_internet;
          break;
        }
        message = S.current.error_no_internet;
        break;
      default:
        message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
        break;
    }
  }

  String _handleError(dynamic statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return '${error['error']}';
      case 401:
        return 'Unauthorized: ${error['error']}';
      case 403:
        return '${error['error']}';
      case 404:
        return 'Item not found!';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Error occurred: ${error.toString()}';
    }
  }

  @override
  String toString() => message;
}
