import 'package:get_it/get_it.dart';
import 'package:taskee/external/client/http_client.dart';
import 'package:taskee/external/datasources/login_datasource_impl.dart';
import 'package:taskee/infra/helpers/endpoints/firebase_endpoints.dart';
import 'package:taskee/infra/models/models.dart';
import 'package:taskee/infra/repositories/login_usecase_impl.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';

import 'domain/usecases/usecases.dart';
import 'external/datasources/datasources.dart';
import 'infra/datasources/datasources.dart';
import 'infra/helpers/helpers.dart';
import 'infra/repositories/usecases.dart';
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
  // serviceLocator.registerFactory<LoginUsecase>(
  //     () => LoginUsecase(serviceLocator<ILoginRepository>()));
  // serviceLocator.registerFactory<RegisterUsecase>(
  //     () => RegisterUsecase(serviceLocator<IRegisterRepository>()));
  // serviceLocator.registerFactory<AddTaskUsecase>(
  //     () => AddTaskUsecase(serviceLocator<IAddTaskRepository>()));
}

void initRepositories() {
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
