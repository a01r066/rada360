import 'package:dio/dio.dart';
import 'package:rada360/model/common/my_data_request.dart';
import 'package:rada360/model/response/auth_data_response.dart';
import 'package:rada360/model/response/common_data_response.dart';
import 'package:rada360/services/remote/network/api_result.dart';
import 'package:rada360/services/remote/network/dio/dio_client.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';

abstract class ApiServicesImpl<T, V> {
  Future<ApiResult<T, V>> getAccessToken(
      {required String endpoint, required Map<String, dynamic> data});

  Future<ApiResult<T, V>> createOtp(
      {required String endpoint, required Map<String, dynamic> data});

  Future<ApiResult<T, V>> verifyOtp(
      {required String endpoint, required Map<String, dynamic> data});

  Future<ApiResult<T, V>> signUp(
      {required String endpoint, required FormData formData});

  Future<ApiResult<T, V>> signIn(
      {required String endpoint, required Map<String, dynamic> data});

  Future<ApiResult<T, V>> logout({required String endpoint});

  Future<ApiResult<T, V>> profile({required String endpoint});

  Future<ApiResult<T, V>> forgetPassword(
      {required String endpoint, required MyDataRequest request});
}

class ApiServices implements ApiServicesImpl {
  final DioClient dioClient;

  const ApiServices({
    required this.dioClient,
  });

  @override
  Future<ApiResult> forgetPassword(
      {required String endpoint, required MyDataRequest request}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResult> logout({required String endpoint}) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ApiResult> profile({required String endpoint}) {
    // TODO: implement profile
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<AuthDataResponse, MyDioException>> signIn(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.post(endpoint, data: data);
      return ApiResult(response: AuthDataResponse.fromMap(response.data));
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }

  @override
  Future<ApiResult<AuthDataResponse, MyDioException>> signUp(
      {required String endpoint, required FormData formData}) async {
    try {
      final response = await dioClient.post(endpoint, data: formData);
      return ApiResult(response: AuthDataResponse.fromMap(response.data));
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }

  @override
  Future<ApiResult<CommonDataResponse, MyDioException>> getAccessToken(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.post(endpoint, data: data);
      return ApiResult(response: CommonDataResponse.fromMap(response.data));
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>, MyDioException>> createOtp(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.post(endpoint, data: data);
      return ApiResult(response: response.data);
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }

  @override
  Future<ApiResult> verifyOtp(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.post(endpoint, data: data);
      return ApiResult(response: response.data);
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }
}
