import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class Users {
  String? id;
  String? email;
  String? name;
  String? gender;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? phone;
  String? accesstoken;

  Users(
      {this.id,
      this.email,
      this.name,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.phone,
      this.accesstoken});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<dynamic, dynamic> toJson() => _$UsersToJson(this);
}
