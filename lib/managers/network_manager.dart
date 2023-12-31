import 'dart:convert';
import 'package:interview_prj/core/app_export.dart';

class NetWorkManager extends APIHandler {
  static NetWorkManager? _shared;
  var dio = Dio();
  late FormData? formData;
  late Map<String, dynamic>? header;
  NetWorkManager._();

  static NetWorkManager shared() => _shared ?? NetWorkManager._();

  Future<dynamic> request({
    String? url,
    RequestMethods? method,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    bool? isAuthRequired,
  }) async {
    try {
      dio.options.contentType = "application/json";
      String token =
          SecureStorageManager.shared.getStringPre(PreferenceKeys.token) ?? "";
      if (url == null) {
        throw Exception(AppErrors.urlError);
      }

      if (isAuthRequired == true) {
        dio.options.headers["Authorization"] = "Bearer $token";
      }

      Response? response;
      log("url====${url} ${params}=== ${method}");
      if (method == RequestMethods.get) {
        response = await dio.get(url);
      } else if (method == RequestMethods.post) {
        var formData = FormData();
        formData = FormData.fromMap(params!);
        response = await dio.post(url, data: formData);
      } else if (method == RequestMethods.put) {
        response = await dio.put(url);
      } else if (method == RequestMethods.patch) {
        var formData = FormData();
        formData = FormData.fromMap(params!);
        response = await dio.patch(url, data: formData);
      } else if (method == RequestMethods.delete) {
        response = await dio.delete(url);
      }

      if (response == null) {
        throw Exception(AppErrors.networkError);
      }

      print(super.returnResponse(response));

      return super.returnResponse(response);
    } catch (exception) {
      if (exception is DioError) {
        print(super.handleException(exception));
        return super.handleException(exception);
      }
    }
  }
}
