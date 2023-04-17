import 'package:dartz/dartz.dart';
import 'package:zapp/src/features/home/domain/repositories/get_news_repository.dart';

import '../entities/news_entity.dart';

abstract class GetNews {
  Future<Either<String, NewsEntity>> call(
      {String? tag,
      required int page,
      required int pageSize,
      required String language});
}

class GetNewsImpl implements GetNews {
  final GetNewsRepository getNewsRepository;

  GetNewsImpl({required this.getNewsRepository});

  @override
  Future<Either<String, NewsEntity>> call(
      {String? tag,
      required int page,
      required int pageSize,
      required String language}) async {
    return await getNewsRepository(
        tag: tag, page: page, pageSize: pageSize, language: language);
  }
}
