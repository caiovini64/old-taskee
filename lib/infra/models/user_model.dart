import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';

class UserModel extends UserEntity {
  final String id;
  final String token;
  final String email;

  UserModel({
    required this.id,
    required this.token,
    required this.email,
  }) : super(id: id, email: email, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['localId'],
      token: json['idToken'],
    );
  }

  @override
  List<Object?> get props => [id, token, email];
}
