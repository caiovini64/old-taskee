import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String token;
  final String email;

  const UserEntity({
    required this.id,
    required this.token,
    required this.email,
  });

  @override
  List<Object?> get props => [id, token, email];
}
