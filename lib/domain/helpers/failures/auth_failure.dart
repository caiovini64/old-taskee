import 'package:taskee/domain/helpers/failures/failure.dart';

class AuthenticationFailure extends Failure {
  final int code;
  final String message;

  AuthenticationFailure({
    required this.code,
    required this.message,
  });

  factory AuthenticationFailure.fromJson(Map<String, dynamic> json) {
    return AuthenticationFailure(
      code: json['error']['code'],
      message: json['error']['message'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
