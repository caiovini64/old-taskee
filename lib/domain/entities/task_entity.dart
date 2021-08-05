import 'dart:math';

import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id = Random().nextInt(999999);
  final String title;
  final String subtitle;
  final String state;

  TaskEntity({
    required this.title,
    required this.subtitle,
    required this.state,
  });

  @override
  List<Object?> get props => [id, title, subtitle, state];
}
