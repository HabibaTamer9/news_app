import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';

part 'cards_model.g.dart';

@HiveType(typeId: 0)
class CardsModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String content;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String authorName;
  @HiveField(6)
  final String date;

  CardsModel({
    required this.title,
    this.description,
    required this.url,
    required this.content,
    required this.image,
    required this.authorName,
    required this.date
  });

  factory CardsModel.fromJson(Map<String,dynamic> json){
    String isoDate = json["publishedAt"];
    DateTime dateTime = DateTime.parse(isoDate);
    String formattedDate = DateFormat("MMM d, yyyy").format(dateTime);

    return CardsModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      content: json["content"] ?? "",
      image: json["urlToImage"] ?? "",
      authorName: json["author"] ?? "",
      date: formattedDate,
    );
  }
}


