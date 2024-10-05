import 'package:dio/dio.dart';
import 'package:rada360/model/common/my_data_request.dart';
import 'package:rada360/model/response/signup_data_response.dart';
import 'package:rada360/services/remote/network/api_result.dart';
import 'package:rada360/services/remote/network/dio/dio_client.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';

abstract class ApiServicesImpl<T, V> {
  Future<ApiResult<T, V>> signUp(
      {required String endpoint, required FormData formData});

  Future<ApiResult<T, V>> signIn(
      {required String endpoint, required MyDataRequest request});

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
  Future<ApiResult> signIn(
      {required String endpoint, required MyDataRequest request}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SignupDataResponse, MyDioException>> signUp(
      {required String endpoint, required FormData formData}) async {
    try {
      final response = await dioClient.post(endpoint, data: formData);
      return ApiResult(response: SignupDataResponse.fromMap(response.data));
    } on DioException catch (e) {
      return ApiResult(exception: MyDioException.fromDioError(e));
    }
  }
}
