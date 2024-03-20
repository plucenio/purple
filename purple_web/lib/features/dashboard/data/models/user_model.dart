import 'package:json_annotation/json_annotation.dart';
import '../../../auth/auth.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.name,
    required super.username,
    required super.password,
    required super.confirmedPassword,
    required super.email,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(User user) {
    return UserModel(
      name: user.name,
      username: user.username,
      password: user.password,
      confirmedPassword: user.confirmedPassword,
      email: user.email,
      phone: user.phone,
    );
  }
}
