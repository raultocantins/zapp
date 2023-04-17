import 'package:zapp/src/features/home/data/models/news_model.dart';

abstract class GetNewsDatasource {
  Future<NewsModel> call(
      {String? tag,
      required int page,
      required int pageSize,
      required String language});
}
