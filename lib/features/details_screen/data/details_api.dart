import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;

class DetailsAPI{
  Future<String> getFullContent(String url) async {
    final dio = Dio();

    final htmlResponse = await dio.get(url);

    final document = parser.parse(htmlResponse.data);

    final paragraphs = document.getElementsByTagName("p");

    String articleText = paragraphs.map((e) => e.text.trim()).join("\n\n");

    return articleText;
  }
}