import 'package:get_it/get_it.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/client/http_client.dart';
import 'package:taskee/data/datasources/login_datasource_impl.dart';
import 'package:taskee/data/helpers/client/connection_client.dart';
import 'package:taskee/data/helpers/endpoints/firebase_endpoints.dart';
import 'package:taskee/data/usecases/usecases.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';

import 'domain/usecases/usecases.dart';
import 'data/datasources/datasources.dart';
import 'data/models/models.dart';
import 'ui/pages/newTask/controller/new_task_controller.dart';
import 'ui/pages/register/controller/register_controller.dart';

final serviceLocator = GetIt.instance;

void initControllers() {
  serviceLocator
      .registerFactory(() => LoginController(serviceLocator<ILoginUsecase>()));
  serviceLocator.registerFactory(
      () => RegisterController(serviceLocator<IRegisterUsecase>()));
  serviceLocator.registerFactory(
      () => NewTaskController(serviceLocator<IAddTaskUsecase>()));
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
      client: serviceLocator<IConnectionClient>(),
      url: FirebaseEndpoints.login('signInWithPassword')));
  serviceLocator.registerFactory<IRegisterDatasource>(() => RegisterDatasource(
      client: serviceLocator<IConnectionClient>(),
      url: FirebaseEndpoints.login('signUp')));
  serviceLocator.registerFactory<IAddTaskDatasource>(() => AddTaskDatasource(
        client: serviceLocator<IConnectionClient>(),
        url: FirebaseEndpoints.realtimeDb(),
        user: serviceLocator<UserModel>(),
      ));
}

void initServices() {
  serviceLocator.registerFactory<IConnectionClient>(() => HttpClient());
}
