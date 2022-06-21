import 'dart:convert';

import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/person.dart';


class PersonModel implements Person {
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  PersonModel(
    this.name,
    this.email,
    this.password,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
