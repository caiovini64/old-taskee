import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/data/models/models.dart';

final kTaskEntity = TaskEntity(
  id: 'id',
  title: 'title',
  subtitle: 'subtitle',
  state: 'todo',
);

final kTaskEntityProgress = TaskEntity(
  id: 'id',
  title: 'title',
  subtitle: 'subtitle',
  state: 'inProgress',
);
final kTaskModel1 = TaskModel(
  id: 'id',
  title: 'title',
  subtitle: 'subtitle',
  state: 'todo',
);
final kTaskModel2 = TaskModel(
  id: 'id2',
  title: 'title',
  subtitle: 'subtitle',
  state: 'todo',
);

final kListTaskModel = [
  kTaskModel1,
  kTaskModel2,
];

final kTaskResponseModel = TaskResponseModel('name');

final kResponseListTaskModel =
    '''{"id":{"state":"todo","subtitle":"subtitle","title":"title","id":"id"},"id2":{"state":"todo","subtitle":"subtitle","title":"title","id":"id"}}''';
final kTaskJson =
    '''{"-MhiC3wpATc42UPvGW4B":{"state":"todo","subtitle":"subtitle","title":"title","id":"id"}''';
