import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  String id;
  String name;

  Source({this.id = "", this.name = ""});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(
      json); //fromjson coverting object to use names directly in flutter
  Map<String, dynamic> toJson() => _$SourceToJson(
      this); //from object or whatever we pass from flutter this convert that to json and send to server
}
