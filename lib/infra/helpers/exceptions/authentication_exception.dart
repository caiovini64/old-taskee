import 'package:taskee/domain/helpers/failures/failure.dart';

class AuthenticationException extends Failure implements Exception {
  final int code;
  final String message;

  AuthenticationException({
    required this.code,
    required this.message,
  });

  factory AuthenticationException.fromJson(Map<String, dynamic> json) {
    return AuthenticationException(
      code: json['error']['code'],
      message: json['error']['message'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
