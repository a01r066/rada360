import 'package:dio/dio.dart';
import 'package:rada360/common/values/global_variables.dart';

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_needAuthorizationHeader(options)) {
      options.headers['Authorization'] = 'Bearer $idTokenGlb';
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return true;
    } else {
      return true;
    }
  }
}
