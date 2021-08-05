import 'package:get_it/get_it.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';
import 'package:taskee/external/client/http_client.dart';
import 'package:taskee/external/datasources/login_datasource_impl.dart';
import 'package:taskee/infra/helpers/endpoints/firebase_endpoints.dart';
import 'package:taskee/infra/repositories/login_repository_impl.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';

import 'domain/repositories/repositories.dart';
import 'domain/usecases/register_usecase.dart';
import 'domain/usecases/usecases.dart';
import 'external/datasources/datasources.dart';
import 'infra/datasources/datasources.dart';
import 'infra/helpers/helpers.dart';
import 'infra/repositories/repositories.dart';
import 'ui/pages/register/controller/register_controller.dart';

final serviceLocator = GetIt.instance;

void initControllers() {
  serviceLocator.registerLazySingleton(
      () => LoginController(serviceLocator<LoginUsecase>()));
  serviceLocator.registerLazySingleton(
      () => RegisterController(serviceLocator<RegisterUsecase>()));
}

void initUsecases() {
  serviceLocator.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(serviceLocator<ILoginRepository>()));
  serviceLocator.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(serviceLocator<IRegisterRepository>()));
  serviceLocator.registerLazySingleton<AddTaskUsecase>(
      () => AddTaskUsecase(serviceLocator<IAddTaskRepository>()));
}

void initRepositories() {
  serviceLocator.registerLazySingleton<ILoginRepository>(
      () => LoginRepository(serviceLocator<ILoginDatasource>()));
  serviceLocator.registerLazySingleton<IRegisterRepository>(
      () => RegisterRepository(serviceLocator<IRegisterDatasource>()));
  serviceLocator.registerLazySingleton<IAddTaskRepository>(
      () => AddTaskRepository(serviceLocator<IAddTaskDatasource>()));
}

void initDatasources() {
  serviceLocator.registerLazySingleton<ILoginDatasource>(() => LoginDatasource(
      client: serviceLocator<IConnectionClient>(),
      url: FirebaseEndpoints.login('signInWithPassword')));
  serviceLocator.registerLazySingleton<IRegisterDatasource>(() =>
      RegisterDatasource(
          client: serviceLocator<IConnectionClient>(),
          url: FirebaseEndpoints.login('signUp')));
  serviceLocator.registerLazySingleton<IAddTaskDatasource>(() =>
      AddTaskDatasource(
          client: serviceLocator<IConnectionClient>(),
          url: FirebaseEndpoints.realtimeDb()));
}

void initServices() {
  serviceLocator.registerLazySingleton<IConnectionClient>(() => HttpClient());
}
