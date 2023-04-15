import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';
import 'package:zapp/src/features/home/domain/entities/tags_entity.dart';
import 'package:zapp/src/features/home/domain/usecases/get_news_usecase.dart';

import '../../domain/entities/tag_entity.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetNews getNews;
  _HomeControllerBase({required this.getNews});

//IS LOADING
  @observable
  bool isLoading = false;

  int pageSize = 10;

  int page = 10;

  @observable
  NewsEntity? news;

  @observable
  TagsEntity tags = TagsEntity([
    TagEntity("Tecnologia"),
    TagEntity("Política"),
    TagEntity("Esportes"),
    TagEntity("Entretenimento"),
    TagEntity("Economia"),
    TagEntity("Saúde"),
    TagEntity("Meio ambiente")
  ]);

//CHANGE LOADING
  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  //CHANGE NEWS
  @action
  changeNews(NewsEntity value) {
    news = value;
  }

  //CHANGE NEWS
  @action
  changePage(int value) {
    page = value;
  }

  fetchNews({TagEntity? tag}) async {
    changeIsLoading(true);
    final result = await getNews(
      tag: tag?.label ?? "",
      page: page,
      pageSize: pageSize,
    );
    result.fold((l) => null, (r) {
      if (tags.tags.isEmpty) {
        changeNews(r);
      } else {
        List<NewsItem> newsData = (news?.articles ?? []);
        newsData.addAll(r.articles);
        changeNews(
          NewsEntity(
            status: r.status,
            total_hits: r.total_hits,
            page: r.page,
            total_pages: r.total_pages,
            page_size: r.page_size,
            articles: newsData,
          ),
        );
      }

      nextPagination(r);
    });
    changeIsLoading(false);
  }

  clearAndFetch({TagEntity? tag}) async {
    changeIsLoading(true);
    final result = await getNews(
      tag: tag?.label ?? "",
      page: page,
      pageSize: pageSize,
    );
    result.fold((l) => null, (r) {
      changeNews(r);
      nextPagination(r);
    });
    changeIsLoading(false);
  }

  moreInfoRedirect(String link) {
    launchUrl(Uri.parse(link));
  }

  nextPagination(NewsEntity newsEntity) {
    if (newsEntity.total_hits > tags.tags.length &&
        page <= newsEntity.total_pages) {
      page++;
    }
  }

  @action
  dispose() {
    isLoading = false;
    news = null;
  }
}
