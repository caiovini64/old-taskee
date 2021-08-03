import 'package:get_it/get_it.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';
import 'package:taskee/external/client/http_client.dart';
import 'package:taskee/external/datasources/login_datasource_impl.dart';
import 'package:taskee/infra/helpers/endpoints/firebase_endpoints.dart';
import 'package:taskee/infra/repositories/login_repository_impl.dart';

import 'domain/repositories/repositories.dart';
import 'infra/datasources/datasources.dart';
import 'infra/helpers/helpers.dart';

final serviceLocator = GetIt.instance;

void init() {
  serviceLocator.registerLazySingleton(
      () => LoginUsecase(serviceLocator<ILoginRepository>()));

  serviceLocator.registerLazySingleton<ILoginRepository>(
      () => LoginRepository(serviceLocator<ILoginDatasource>()));

  serviceLocator.registerLazySingleton<ILoginDatasource>(() => LoginDatasource(
      client: serviceLocator<IConnectionClient>(),
      url: FirebaseEndpoints.login('signInWithPassword')));

  serviceLocator.registerLazySingleton<IConnectionClient>(() => HttpClient());
}
