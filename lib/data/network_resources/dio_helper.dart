import 'package:dexef_task/data/network_resources/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: NetworkConstants.baseUrl,
      responseType: ResponseType.json,
    ));
  }

  static Future<Response> getData(
      {String? endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params}) async {
    return await dio!.get(
      endPoint!,
      data: body,
      queryParameters: params,
    );
  }

  static Future<Response> postData(
      {String? endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params}) async {
    return await dio!.post(endPoint!, data: body, queryParameters: params);
  }
}
