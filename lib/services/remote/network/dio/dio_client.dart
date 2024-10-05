import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rada360/config/flavor_config.dart';
import 'package:rada360/services/remote/network/dio/interceptors/interceptors.dart';
import 'package:rada360/services/remote/network/endpoints.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = FlavorConfig.appUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json
      // ..options.headers = {
      //   'Device-id': deviceIdGlb,
      // }
      ..interceptors.addAll([
        AuthorizationInterceptor(),
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90)
        // InterceptorsWrapper(
        //     onRequest:(options, handler){
        //       // Do something before request is sent
        //       return handler.next(options); //continue
        //       // If you want to resolve the request with some custom data，
        //       // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        //       // If you want to reject the request with a error message,
        //       // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        //     },
        //     onResponse:(response,handler) {
        //       // Do something with response data
        //       return handler.next(response); // continue
        //       // If you want to reject the request with a error message,
        //       // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        //     },
        //     onError: (DioError e, handler) {
        //       // Do something with response error
        //       return  handler.next(e);//continue
        //       // If you want to resolve the request with some custom data，
        //       // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        //     }
        // )
      ]);
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Download: ---------
  Future<Response> download(
    String url,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? data,
    CancelToken? cancelToken,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.download(
        url,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put (update):-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Patch (update):-----------------------------------------------------------------------
  Future<Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
