import 'package:dio/dio.dart';
import 'package:zapp/src/features/home/data/datasources/get_news_datasource.dart';
import 'package:zapp/src/features/home/data/models/news_model.dart';

class GetNewsDatasourceImpl implements GetNewsDatasource {
  @override
  Future<NewsModel> call(
      {String? tag,
      required int page,
      required int pageSize,
      required String language}) async {
    try {
      final dio = Dio();
      dio.options.headers["filter"] = tag;
      dio.options.headers["page"] = page.toString();
      dio.options.headers["pagesize"] = pageSize.toString();
      dio.options.headers["language"] = language;
      final response = await dio.get('https://zback.herokuapp.com/news');

      return NewsModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
