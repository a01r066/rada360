import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:viez_universe/src/common/utils/network_utils.dart';

class NetworkException implements Exception {
  String message;
  String? errorCode;
  int? statusCode;

  NetworkException(this.message, {this.errorCode, this.statusCode});

  @override
  String toString() {
    return 'NetworkException{message: $message, errorCode: $errorCode, statusCode: $statusCode}';
  }

  static NetworkException handleResponse(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return NetworkException("Bad Request: ${error['message']}");
      case 401:
        return NetworkException("Unauthorized: ${error['message']}");
      case 403:
        return NetworkException("Forbidden: ${error['message']}");
      case 404:
        return NetworkException("Not Found");
      case 409:
        return NetworkException("Error due to a conflict");
      case 408:
        return NetworkException("Request Timeout");
      case 500:
        return NetworkException("Internal Server Error");
      case 502:
        return NetworkException("Bad Gateway");
      case 503:
        return NetworkException("Service Unavailable");
      default:
        return NetworkException("Received invalid status code: $statusCode");
    }
  }

  static Future<NetworkException> getNetworkException(error) async {
    var isNetworkAvailable = await NetworkUtils.isNetworkAvailable();
    if (!isNetworkAvailable) {
      return NetworkException("không có kết nối Internet");
    }
    if (error is NetworkException) return error;
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.error) {
            case DioExceptionType.cancel:
              return NetworkException("Request Cancelled");
            case DioExceptionType.connectionTimeout:
              return NetworkException("Connection request timeout");
            case DioExceptionType.unknown:
              return NetworkException(error.error.toString());
            case DioExceptionType.sendTimeout:
              return NetworkException(
                  "Send timeout in connection with API server");
            case DioExceptionType.badResponse:
              if (error.error.toString().contains("XMLHttpRequest")) {
                return NetworkException("Connection Failed");
              } else {
                return NetworkException.handleResponse(
                    error.response!.statusCode!, error.response?.data);
              }
            case DioExceptionType.receiveTimeout:
              return NetworkException(
                  "Receive timeout in connection with API server");
          }
        } else if (error is SocketException) {
          return NetworkException("Không có kết nối mạng}");
        } else {
          return NetworkException("Unexpected error occurred");
        }
      } on FormatException catch (e) {
        debugPrint(e.toString());
        return NetworkException("Format Exception");
      } catch (_) {
        return NetworkException("Unexpected error occurred");
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkException("Unable to process the data");
      } else {
        return NetworkException("Unexpected error occurred");
      }
    }
    return NetworkException("Unexpected error occurred");
  }
}
