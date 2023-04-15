import 'package:dio/dio.dart';
import 'package:zapp/src/features/home/data/datasources/get_news_datasource.dart';
import 'package:zapp/src/features/home/data/models/news_model.dart';

class GetNewsDatasourceImpl implements GetNewsDatasource {
  @override
  Future<NewsModel> call(
      {String? tag, required int page, required int pageSize}) async {
    try {
      final dio = Dio();
      dio.options.headers["filter"] = tag;
      dio.options.headers["page"] = page.toString();
      dio.options.headers["pageSize"] = pageSize.toString();
      final response = await dio.get('http://192.168.100.5:3000/news');

      return NewsModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
