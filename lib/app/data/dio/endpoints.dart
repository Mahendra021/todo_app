class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://jsonplaceholder.typicode.com/"; // STAG
  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 50000);
  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 50000);

  // endpoints
  static const String todos = "todos";
}
