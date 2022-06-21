abstract class Response {
  final String message;
  final int statusCode;
  final Map data;

  Response({
    required this.message,
    required this.statusCode,
    required this.data,
  });
}
