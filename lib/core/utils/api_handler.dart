import 'dart:convert';
import 'dart:io';
import 'package:interview_prj/core/constants/http_responses.dart';
import 'package:interview_prj/core/app_export.dart';

class APIHandler {
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case HttpResponse.OK:
        if (response.data is String) {
          return json.decode(response.data.toString());
        } else {
          return response.data;
        }
      case HttpResponse.BadRequest:
        throw Exception("Invalid Request}");
      case HttpResponse.Unauthorized:
      case HttpResponse.Forbidden:
        throw Exception("Unauthorised request");
      case HttpResponse.InternalServerError:
        throw Exception("Internal server error");
      case HttpResponse.invalidRequest:
        throw Exception("Invalid Request, ${response.data.toString()}");
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }

  handleException(DioError exception) {
    if(exception.error is SocketException) {
      throw Exception(AppErrors.networkError);
    }

    throw exception.response?.data;
  }
}

enum RequestMethods {
  get,
  post,
  put,
  delete,
  upload,
  download
}