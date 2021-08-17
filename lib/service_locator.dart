import 'package:get_it/get_it.dart';

import 'package:taskee/data/adapters/adapters.dart';
import 'package:taskee/data/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/data/usecases/usecases.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/newTask/cubit/new_task_cubit.dart';

final serviceLocator = GetIt.instance;

void initControllers() {
  serviceLocator
      .registerFactory(() => LoginCubit(serviceLocator<ILoginUsecase>()));
  serviceLocator
      .registerFactory(() => RegisterCubit(serviceLocator<IRegisterUsecase>()));
  serviceLocator
      .registerFactory(() => NewTaskCubit(serviceLocator<IAddTaskUsecase>()));
}

void initUsecases() {
  serviceLocator.registerFactory<ILoginUsecase>(
      () => LoginUsecase(serviceLocator<ILoginDatasource>()));
  serviceLocator.registerFactory<IRegisterUsecase>(
      () => RegisterUsecase(serviceLocator<IRegisterDatasource>()));
  serviceLocator.registerFactory<IAddTaskUsecase>(
      () => AddTaskUsecase(serviceLocator<IAddTaskDatasource>()));
}

void initDatasources() {
  serviceLocator.registerFactory<ILoginDatasource>(() => LoginDatasource(
      client: serviceLocator<IHttpClient>(),
      url: FirebaseEndpoints.login('signInWithPassword')));
  serviceLocator.registerFactory<IRegisterDatasource>(() => RegisterDatasource(
      client: serviceLocator<IHttpClient>(),
      url: FirebaseEndpoints.login('signUp')));
  serviceLocator.registerFactory<IAddTaskDatasource>(() => AddTaskDatasource(
        client: serviceLocator<IHttpClient>(),
        url: FirebaseEndpoints.realtimeDb(),
        user: serviceLocator<UserModel>(),
      ));
}

void initServices() {
  serviceLocator.registerFactory<IHttpClient>(() => HttpAdapter());
}
