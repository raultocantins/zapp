import 'package:dartz/dartz.dart';
import 'package:zapp/src/features/home/data/datasources/get_news_datasource.dart';
import 'package:zapp/src/features/home/data/models/news_model.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/repositories/get_news_repository.dart';

class GetNewsRepositoryImpl implements GetNewsRepository {
  final GetNewsDatasource getNewsDatasource;

  GetNewsRepositoryImpl({required this.getNewsDatasource});
  @override
  Future<Either<String, NewsEntity>> call({String? tag}) async {
    try {
      var result = await getNewsDatasource(tag: tag);

      NewsEntity listEventEntity = NewsModel.toEntity(result);

      return Right(listEventEntity);
    } catch (e) {
      return const Left("Não foi possível obter eventos");
    }
  }
}
