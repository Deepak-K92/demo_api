import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../home/data_layer/data_sources/post_xml_data_source.dart';
import '../home/domain_layer/repository/post_data_repository.dart';
import '../home/domain_layer/usecase/post_data_usecase.dart';

GetIt locator = GetIt.instance;

Future initLocator() async {
  //! UseCase
  locator.registerFactory<PostDataUseCase>(
      () => PostDataUseCaseImpl(postDataRepository: locator()));

  //! Repository
  locator.registerLazySingleton<PostDataRepository>(
      () => PostDataRepositoryImpl(postDataDataSource: locator()));

  //! DataSource
  locator.registerLazySingleton<PostDataDataSource>(
      () => PostDataSourceImpl(client: locator()));

  //! External
  locator.registerLazySingleton(() => http.Client());
}
