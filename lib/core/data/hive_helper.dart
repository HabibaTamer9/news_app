import 'package:hive/hive.dart';
import 'package:news/features/home_screen/models/cards_model.dart';

class HiveHelper{
  static Box<bool> themeBox = Hive.box<bool>('themeBox');
  static bool theme = themeBox.get('theme') ?? false;
  static Box<String> languageBox = Hive.box<String>('languageBox');
  static String language = languageBox.get('language') ?? "en";

  static Box<CardsModel> newsBox = Hive.box<CardsModel>('newsBox');
  static List<CardsModel> newsList = newsBox.values.toList();

  Future<void> getNews() async {
    newsBox = Hive.box<CardsModel>('newsBox');
    newsList = newsBox.values.toList();
  }

  Future<void> addNews(
      {required CardsModel newsCard}) async {
    CardsModel news = newsCard;
    newsBox.add(news);
    newsList = newsBox.values.toList();
  }
  Future<void> deleteNews(int index) async {
    newsBox.deleteAt(index);
    getNews();
  }

  Future<void> getTheme() async {
    themeBox = Hive.box<bool>('themeBox');
    theme = themeBox.get('theme') ?? false;

  }

  Future<void> changeTheme(bool value) async {
    themeBox.put('theme', value);
    getTheme();
  }

  Future<void> getLanguage() async {
    languageBox = Hive.box<String>('languageBox');
    language = languageBox.get('language') ?? "en";

  }

  Future<void> changeLanguage(String value) async {
    languageBox.put('language', value);
    getLanguage();
  }


}