import 'package:json_annotation/json_annotation.dart';
import 'package:newtest/datamodels/source.dart';

part 'articalsmodel.g.dart';

@JsonSerializable()
class Article {
  Source? source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    this.source,
    this.author = "",
    this.title = "",
    this.description = "",
    this.url = "",
    this.urlToImage = "",
    this.publishedAt = "",
    this.content = "",
  });
  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(
      json); //fromjson coverting object to use names directly in flutter
  Map<String, dynamic> toJson() => _$ArticleToJson(
      this); //from object or whatever we pass from flutter this convert that to json and send to server
}
