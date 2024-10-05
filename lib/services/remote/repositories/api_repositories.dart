import 'package:dio/dio.dart';
import 'package:rada360/model/common/my_data_request.dart';
import 'package:rada360/model/response/signup_data_response.dart';
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
      {required String endpoint, required MyDataRequest request}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SignupDataResponse, MyDioException>> signUp(
      {required String endpoint, required FormData formData}) async {
    return apiServices.signUp(endpoint: endpoint, formData: formData);
  }
}
