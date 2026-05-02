import 'package:news/core/const/language.dart';
import 'package:news/core/data/api_helper.dart';
import 'package:news/features/home_screen/models/cards_model.dart';

import '../../../core/data/api.dart';

class GetData{
  static Future<List<CardsModel>> getSearchData({required String q }) async {
    final response = await ApiHelper().getData(endpoint: ApiKey.search,
        query: {
          "q" : q,
          "sortBy" : "popularity",
          "language" : language ,
          "apiKey" : ApiKey.apiKey
        });

    return List<CardsModel>.from(
      response.map((item) => CardsModel.fromJson(item)),
    );
  }
}