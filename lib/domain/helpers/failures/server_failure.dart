import 'package:taskee/domain/helpers/failures/failure.dart';

class ServerFailure extends Failure {
  final String _message = 'Ops! Something wrong with the server.';
  String get message => _message;
  @override
  List<Object?> get props => [];
}
