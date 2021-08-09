import 'package:get_it/get_it.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';
import 'package:taskee/external/client/http_client.dart';
import 'package:taskee/external/datasources/login_datasource_impl.dart';
import 'package:taskee/infra/helpers/endpoints/firebase_endpoints.dart';
import 'package:taskee/infra/models/models.dart';
import 'package:taskee/infra/repositories/login_repository_impl.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';

import 'domain/repositories/repositories.dart';
import 'domain/usecases/register_usecase.dart';
import 'domain/usecases/usecases.dart';
import 'external/datasources/datasources.dart';
import 'infra/datasources/datasources.dart';
import 'infra/helpers/helpers.dart';
import 'infra/repositories/repositories.dart';
import 'ui/pages/newTask/controller/new_task_controller.dart';
import 'ui/pages/register/controller/register_controller.dart';

final serviceLocator = GetIt.instance;

void initControllers() {
  serviceLocator
      .registerFactory(() => LoginController(serviceLocator<LoginUsecase>()));
  serviceLocator.registerFactory(
      () => RegisterController(serviceLocator<RegisterUsecase>()));
  serviceLocator.registerFactory(
      () => NewTaskController(serviceLocator<IAddTaskRepository>()));
}

void initUsecases() {
  serviceLocator.registerFactory<LoginUsecase>(
      () => LoginUsecase(serviceLocator<ILoginRepository>()));
  serviceLocator.registerFactory<RegisterUsecase>(
      () => RegisterUsecase(serviceLocator<IRegisterRepository>()));
  // serviceLocator.registerFactory<AddTaskUsecase>(
  //     () => AddTaskUsecase(serviceLocator<IAddTaskRepository>()));
}

void initRepositories() {
  serviceLocator.registerFactory<ILoginRepository>(
      () => LoginRepository(serviceLocator<ILoginDatasource>()));
  serviceLocator.registerFactory<IRegisterRepository>(
      () => RegisterRepository(serviceLocator<IRegisterDatasource>()));
  serviceLocator.registerFactory<IAddTaskRepository>(
      () => AddTaskRepository(serviceLocator<IAddTaskDatasource>()));
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
