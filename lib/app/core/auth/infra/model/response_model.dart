// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';

class ResponseModel implements Response {
  @override
  final String message;
  @override
  final int statusCode;
  @override
  final Map data;
  ResponseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': statusCode,
      'data': data,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      message: map['message'] as String,
      statusCode: map['status'] as int,
      data: Map.from(map['data'] as Map),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
