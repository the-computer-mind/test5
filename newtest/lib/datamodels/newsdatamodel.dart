import 'package:json_annotation/json_annotation.dart';
import 'package:newtest/datamodels/articalsmodel.dart';

part 'newsdatamodel.g.dart';

@JsonSerializable()
class NewsResponse {
  String status;
  int totalResults;
  List<Article>? articles;

  NewsResponse({
    this.status = "",
    this.totalResults = 0,
    this.articles,
  });
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(
          json); //fromjson coverting object to use names directly in flutter
  Map<String, dynamic> toJson() => _$NewsResponseToJson(
      this); //from object or whatever we pass from flutter this convert that to json and send to server
}
