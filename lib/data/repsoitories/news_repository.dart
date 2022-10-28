import 'package:api_with_cubit/data/models/articles/articles.dart';
import 'package:api_with_cubit/data/services/api_provider.dart';

class NewsRepository{

  NewsRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<Articles>> getAllNewsTesla() => apiProvider.getTeslaNewsList();
  Future<List<Articles>> getAllNewsApple() => apiProvider.getAppleNewsList();
  Future<List<Articles>> getAllNewsBusiness() => apiProvider.getBusinessUSNewsList();
  Future<List<Articles>> getAllNewsTechCrunch() => apiProvider.getTechCrunchNewsList();
  Future<List<Articles>> getAllNewsWallStreetJournal() => apiProvider.getWallStreetJournalNewsList();
}