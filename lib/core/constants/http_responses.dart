// region HTTPS Response Codes
class HttpResponse {
  static const int OK = 200;
  static const int Created = 201;
  static const NoContent = 204;
  static const int PartialContent = 206;
  static const int BadRequest = 400;
  static const int Unauthorized = 401;
  static const int Forbidden = 403;
  static const int NotFound = 404;
  static const int invalidRequest = 406;
  static const int InternalServerError = 500;
  static const int BadGateway = 502;
}