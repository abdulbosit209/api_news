import 'package:api_with_cubit/data/models/articles/articles.dart';
import 'package:api_with_cubit/data/services/api_client.dart';
import 'package:api_with_cubit/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<Articles>> getAppleNewsList() async {
    Response response =
    await apiClient.dio.get(apiClient.dio.options.baseUrl,
    queryParameters: {
      "q": "apple",
      "from": "2022-10-01",
      "to": "2022-10-01",
      "sortBy": "popularity",
      "apiKey": apiKey
    });

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data["articles"] as List?)
          ?.map((item) => Articles.fromJson(item))
          .toList() ??
          [];
    } else {
      throw Exception();
    }
  }


  Future<List<Articles>> getTeslaNewsList() async {
    try{
      Response response =
      await apiClient.dio.get(apiClient.dio.options.baseUrl,
          queryParameters: {
            "q": "tesla",
            "from": "2022-09-04",
            "sortBy": "publishedAt",
            "apiKey": apiKey,
          }
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data["articles"] as List?)
            ?.map((item) => Articles.fromJson(item))
            .toList() ??
            [];
      } else {
        throw Exception();
      }
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<List<Articles>> getBusinessUSNewsList() async {
    Response response =
    await apiClient.dio.get(apiClient.dio.options.baseUrl,
        queryParameters: {
          "apiKey": apiKey,
          "country": "us",
          "category": "business"

        }
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data["articles"] as List?)
          ?.map((item) => Articles.fromJson(item))
          .toList() ??
          [];
    } else {
      throw Exception();
    }
  }

  Future<List<Articles>> getTechCrunchNewsList() async {
    Response response =
    await apiClient.dio.get(apiClient.dio.options.baseUrl,
        queryParameters: {
          "apiKey": apiKey,
          "sources": "techcrunch"

        }
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data["articles"] as List?)
          ?.map((item) => Articles.fromJson(item))
          .toList() ??
          [];
    } else {
      throw Exception();
    }
  }

  Future<List<Articles>> getWallStreetJournalNewsList() async {
    Response response =
    await apiClient.dio.get(apiClient.dio.options.baseUrl,
        queryParameters: {
          "domains": "wsj.com",
          "apiKey": apiKey
        }
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data["articles"] as List?)
          ?.map((item) => Articles.fromJson(item))
          .toList() ??
          [];
    } else {
      throw Exception();
    }
  }
}