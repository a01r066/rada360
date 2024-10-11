import 'package:dio/dio.dart';
import 'package:rada360/model/common/my_data_request.dart';
import 'package:rada360/model/response/auth_data_response.dart';
import 'package:rada360/model/response/common_data_response.dart';
import 'package:rada360/services/remote/network/api_result.dart';
import 'package:rada360/services/remote/network/api_services.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';

class ApiRepositories implements ApiServicesImpl {
  final ApiServices apiServices;

  const ApiRepositories({
    required this.apiServices,
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
      {required String endpoint, required Map<String, dynamic> data}) async {
    return apiServices.signIn(endpoint: endpoint, data: data);
  }

  @override
  Future<ApiResult<AuthDataResponse, MyDioException>> signUp(
      {required String endpoint, required FormData formData}) async {
    return apiServices.signUp(endpoint: endpoint, formData: formData);
  }

  @override
  Future<ApiResult<CommonDataResponse, MyDioException>> getAccessToken(
      {required String endpoint, required Map<String, dynamic> data}) async {
    return apiServices.getAccessToken(endpoint: endpoint, data: data);
  }

  @override
  Future<ApiResult> createOtp(
      {required String endpoint, required Map<String, dynamic> data}) {
    return apiServices.createOtp(endpoint: endpoint, data: data);
  }

  @override
  Future<ApiResult> verifyOtp(
      {required String endpoint, required Map<String, dynamic> data}) {
    return apiServices.verifyOtp(endpoint: endpoint, data: data);
  }
}
