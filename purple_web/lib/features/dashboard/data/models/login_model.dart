import 'package:json_annotation/json_annotation.dart';
import '../../../auth/auth.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Login {
  const LoginModel({
    required super.username,
    required super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  factory LoginModel.fromEntity(Login login) {
    return LoginModel(
      username: login.username,
      password: login.password,
    );
  }
}
