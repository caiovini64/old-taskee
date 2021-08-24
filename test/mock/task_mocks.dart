import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/data/models/models.dart';

final kTaskEntity = TaskEntity(
  id: 'id',
  title: 'title',
  subtitle: 'subtitle',
  state: 'todo',
);
final kTaskModel = TaskModel(
  id: 'id',
  title: 'title',
  subtitle: 'subtitle',
  state: 'todo',
);

final kListTaskModel = [
  kTaskModel,
  kTaskModel,
];

final kTaskResponseModel = TaskResponseModel('name');

final kResponseListTaskModel =
    '''{"-MhiC3wpATc42UPvGW4B":{"state":"todo","subtitle":"subtitle","title":"title","id":"id"},"-Mhmc7piHP-tpKK7YPAz":{"state":"todo","subtitle":"subtitle","title":"title","id":"id"}}''';
