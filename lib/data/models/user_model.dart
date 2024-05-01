import '../../domain/entities/user_entity.dart';
import 'dart:convert';


class UserModel extends UserEnity {
  const UserModel(
      {required super.email,
      super.countryName,
      super.displayName,
      super.phoneNumber,
      super.password,
      super.image,
      });

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'].toString(),
      displayName: map['name'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      countryName: map['country'].toString(),
      image: map['image'].toString(),
    );
  }
}


  //   factory UserModel.fromFirestore(DocumentSnapshot doc) {
  //   return UserModel(
  //       email: doc['email'] as String,
  //       countryName: doc['country']?.toString() ?? '',
  //       displayName: doc['name']?.toString() ?? '',
  //       phoneNumber: doc['phoneNumber']?.toString() ?? '',
  //     );
  // }

  // Map<String, dynamic> toFirestore() {
  //   return {
      
  //   };
  // }
