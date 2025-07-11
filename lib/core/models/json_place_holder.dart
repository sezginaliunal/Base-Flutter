import 'package:json_annotation/json_annotation.dart';
part 'json_place_holder.g.dart';

@JsonSerializable()
class JsonPlaceHolder {
  int? userId;
  int? id;
  String? title;
  String? body;

  JsonPlaceHolder({this.userId, this.id, this.title, this.body});

  factory JsonPlaceHolder.fromJson(Map<String, dynamic> json) =>
      _$JsonPlaceHolderFromJson(json);

  Map<String, dynamic> toJson() => _$JsonPlaceHolderToJson(this);
}
