import 'package:dio/dio.dart';
import 'package:todo_app/app/data/dio/endpoints.dart';
import 'client.dart';

class APIManager {
  static Future<Response> getTodos() async {
    return DioClient(
      isOverlayLoader: false,
    ).get(
      Endpoints.todos,
    );
  }
}
