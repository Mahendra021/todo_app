import 'dart:async';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  bool isOverlayLoader;

  AppInterceptors({
    this.isOverlayLoader = true,
  });

  @override
  FutureOr<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // isOverlayLoader ? DialogHelper.showLoading() : null;
    super.onRequest(options, handler);
    if (options.data != null) {
      print(options.data.fields);
    }
    print(options.uri);
    if (options.queryParameters.isNotEmpty) {
      print(options.queryParameters);
    }
  }

  @override
  FutureOr<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);

    // isOverlayLoader ? DialogHelper.hideDialog() : null;
  }

  @override
  FutureOr<dynamic> onError(DioError dioError, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    super.onError(dioError, handler);

    // isOverlayLoader ? DialogHelper.hideDialog() : null;

    // final errorMessage = DioExceptions.fromDioError(dioError).toString();
    // if (dioError.type != DioErrorType.response) {
    //   MyUtils.showMySnackbar(
    //     errorMessage,
    //     color: Colors.red,
    //   );
    // } else {
    //   if (errorMessage != "") {
    //     MyUtils.showMySnackbar(
    //       errorMessage,
    //       color: Colors.red,
    //     );
    //   }
    // }

    // showSnakbar == true ? MyUtil.showMySnackbar(Strings.Notification, errorMessage) : null;
    // if ((dioError.response?.statusCode == 401 &&
    //     errorMessage == "Unauthorized")) {
    // Get.find<ProfileController>().finalLogout();
    // }
    /* if ((dioError.response?.statusCode == 401 && dioError.response?.data['message'] == "invalid token")) {
      if (await refreshToken()) {
        return handler.resolve(await retry(dioError.requestOptions));
      }
    }*/

    return handler.next;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
