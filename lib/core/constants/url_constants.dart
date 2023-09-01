mixin UrlConstants {
  final String baseUrl = "https://nibrahim.pythonanywhere.com/";
  static const String apiKey = "?api_key=2bF9B";
  final String students = "students/$apiKey";
  String student(id) => "students/$id$apiKey";
  final String subjects = "subjects/$apiKey";
  String subject(id) => "subjects/$id$apiKey";
  final String classrooms = "classrooms/$apiKey";
  String classroom(id) => "classrooms/$id$apiKey";
  String assignToClassroom(id) => "classrooms/$id$apiKey";
  String registration({id=""}) => "registration/$id$apiKey";
}
