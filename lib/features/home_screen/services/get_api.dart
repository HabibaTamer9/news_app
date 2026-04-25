import 'package:news/core/const/language.dart';
import 'package:news/core/data/api_helper.dart';
import 'package:news/core/data/lists.dart';

import '../../../core/data/api.dart';
import '../models/cards_model.dart';

class GetAPI {
  static Future<List<CardsModel>> getSearch() async {

    if(AppLists.homeCardList.isNotEmpty){
      return AppLists.homeCardList;
    }
    final response = await  ApiHelper().hasInternet(ApiHelper().getData(endpoint: ApiKey.search, query: {
      "q": "Business",
      "sortBy": "popularity",
      "language": language,
      "apiKey": ApiKey.apiKey
    }));


    var list = List<CardsModel>.from(
      response.map((item) => CardsModel.fromJson(item)),
    );

    AppLists.homeCardList = list;

    return list;
  }

  static Future<List<CardsModel>> getTopHeadLines() async {

    if(AppLists.smallCardList.isNotEmpty){
      return AppLists.smallCardList;
    }
    final response = await ApiHelper().getData(endpoint: ApiKey.search, query: {
      "q": "news",
      "sortBy": "publishedAt",
      "language": language,
      "apiKey": ApiKey.apiKey
    });

    var list = List<CardsModel>.from(
      response.map((item) => CardsModel.fromJson(item)),
    );

    AppLists.smallCardList = list;

    return list;
  }
}
