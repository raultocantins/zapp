import 'package:get_it/get_it.dart';
import 'package:zapp/src/features/home/data/repositories/get_news_repository.dart';
import 'package:zapp/src/features/home/domain/usecases/get_news_usecase.dart';
import 'package:zapp/src/features/home/external/datasources/get_news_datasource.dart';
import 'package:zapp/src/features/home/presenter/controllers/home_controller.dart';

registerDependencies() {
  GetIt getIt = GetIt.instance;

  //HOME CONTROLLER
  getIt.registerLazySingleton<HomeController>(() => HomeController(
        getNews: getIt(),
      ));

  //GET NEWS
  getIt.registerLazySingleton<GetNews>(() => GetNewsImpl(
      getNewsRepository:
          GetNewsRepositoryImpl(getNewsDatasource: GetNewsDatasourceImpl())));
}
