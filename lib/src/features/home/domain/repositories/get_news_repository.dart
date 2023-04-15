import 'package:dartz/dartz.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';

abstract class GetNewsRepository {
  Future<Either<String, NewsEntity>> call(
      {String? tag, required int page, required int pageSize});
}
