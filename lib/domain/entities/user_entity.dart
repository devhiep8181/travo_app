// Dart imports:
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEnity extends Equatable {
  factory UserEnity.fromJson(String source) =>
      UserEnity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserEnity.fromMap(Map<String, dynamic> map) {
    return UserEnity(
      email: map['emai'].toString(),
      password: map['password'].toString(),
      displayName: map['displayName'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      countryName: map['countryName'].toString(),
      image: map['image'].toString(),
    );
  }
  const UserEnity({
    required this.email,
    this.password,
    this.displayName,
    this.phoneNumber,
    this.countryName,
    this.image,
  });

  final String email;
  final String? password;
  final String? displayName;
  final String? phoneNumber;
  final String? countryName;
  final String? image;

  @override
  List<Object?> get props =>
      [email, password, displayName, phoneNumber, countryName, image];

  Map<String, dynamic> toMap() {
    return {
      'emai': email,
      'password': password,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'countryName': countryName,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
