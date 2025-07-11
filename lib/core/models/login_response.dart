import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  @JsonKey(name: '_id')
  final String id;

  final String accessToken;

  final String userId;

  LoginResponse({
    required this.id,
    required this.accessToken,
    required this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // Hive verisini JSON'a dönüştürme fonksiyonu (gerekiyorsa eklenebilir)
  // Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
