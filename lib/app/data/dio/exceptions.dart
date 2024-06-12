// import 'package:alfnr/generated/locales.g.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';

class DioExceptions implements Exception {
  late String message;

  // DioExceptions.fromDioError(DioError dioError) {
  //   switch (dioError.type) {
  //     case DioErrorType.cancel:
  //       message = LocaleKeys.api_cancel.tr;
  //       break;
  //     case DioErrorType.connectTimeout:
  //       message = LocaleKeys.api_connection_timeout.tr;
  //       break;
  //     case DioErrorType.receiveTimeout:
  //       message = LocaleKeys.api_receive_timeout.tr;
  //       break;
  //     case DioErrorType.response:
  //       message = _handleError(
  //         dioError.response?.statusCode,
  //         dioError.response?.data,
  //       );
  //       break;
  //     case DioErrorType.sendTimeout:
  //       message = LocaleKeys.api_send_timeout.tr;
  //       break;
  //     case DioErrorType.other:
  //       if (dioError.message.contains("Connection failed")) {
  //         message = LocaleKeys.api_no_internet.tr;
  //         break;
  //       }
  //       if (dioError.message.contains("Connection refused")) {
  //         message = LocaleKeys.api_server_down.tr;
  //         break;
  //       }
  //       message = LocaleKeys.api_unexpected_error.tr;
  //       break;
  //     default:
  //       message = LocaleKeys.something_went_wrong.tr;
  //       break;
  //   }
  // }

  // String _handleError(int? statusCode, dynamic error) {
  //   switch (statusCode) {
  //     case 400:
  //       return "";
  //     case 401:
  //       return "";
  //     case 403:
  //       return LocaleKeys.api_forbidden_error.tr;
  //     case 404:
  //       return LocaleKeys.api_not_found.tr;
  //     case 500:
  //       return LocaleKeys.api_internal_server_error.tr;
  //     case 502:
  //       return LocaleKeys.api_bad_gateway.tr;
  //     default:
  //       return LocaleKeys.something_went_wrong.tr;
  //   }
  // }

  @override
  String toString() => message;
}
